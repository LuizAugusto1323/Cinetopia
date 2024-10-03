//
//  MoviesView.swift
//  Cinetopia
//
//  Created by Luiz Augusto Fernandes Gomes de Lima on 27/09/24.
//

import UIKit

class MoviesView: UIView {
    
    // MARK: - Attributes
    private var filteredMovies: [Movie] = []
    private var isSearchActive: Bool = false
    private var movies: [Movie] = []
    private var presenter: MoviesPresenterToViewProtocol?
    
    // MARK: - UI Components
    // (set) para conseguir ler a searchBar fora do arquivo
    private(set) lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Pesquisar"
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.textColor = .background
        searchBar.delegate = self
        return searchBar
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        // self = MoviesViewController - fornecedor de dados para a tableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "movieCell")
        return tableView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .background
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Class Methods
    private func addSubviews() {
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// determina o que deve ser exibido em cada célula da tabela.
extension MoviesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearchActive ? filteredMovies.count : movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell {
            let movie = isSearchActive ? filteredMovies[indexPath.row] :movies[indexPath.row]
            cell.configureCell(movie: movie)
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}

// define e lida com interações na tabela.
extension MoviesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movie = isSearchActive ? filteredMovies[indexPath.row] :movies[indexPath.row]
        presenter?.didSelect(movie: movie)
        searchBar.resignFirstResponder()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}

extension MoviesView: MovieTableViewCellDelegate {
    func didSelectFavoriteButton(sender: UIButton) {
        guard let cell = sender.superview?.superview as? MovieTableViewCell else { return }
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let selectedMovie = movies[indexPath.row]
        
        presenter?.didSelectedFavoriteButton(selectedMovie)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

extension MoviesView: MoviesViewProtocol {
    func setPresenter(_ presenter: any MoviesPresenterToViewProtocol) {
        self.presenter = presenter
    }
    
    func setupView(with movies: [Movie]) {
        self.movies = movies
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func reloadRow(at indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func toggle(_ isActive: Bool) {
        self.isSearchActive = isActive
    }
    
}

// é chamado sempre que o texto da UISearchBar é alterado.
// o & comercial (&) precisa ser colcado por que a variavel filteredMovies
// que foi declarada no metodo do didSearchText é acompanhada no inout
extension MoviesView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.didSearchText(searchBar, textDidChange: searchText, movies, &filteredMovies)
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
