//
//  MovieDetailsViewController.swift
//  Cinetopia
//
//  Created by Luiz Augusto Fernandes Gomes de Lima on 19/08/24.
//

import UIKit
import Kingfisher

class MovieDetailsViewController: UIViewController {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.title
        label.textColor = .accent
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    private lazy var moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        let url = URL(string: movie.image)
        imageView.kf.setImage(with: url)
        return imageView
    }()
    
    private lazy var rateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Classificação dos usuários: \(movie.rate)"
        label.textColor = .accent
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private lazy var synopsisLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.synopsis
        label.textColor = .accent.withAlphaComponent(0.75)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews(){
        view.addSubview(titleLabel)
        view.addSubview(moviePosterImageView)
        view.addSubview(rateLabel)
        view.addSubview(synopsisLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            //
            moviePosterImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            moviePosterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moviePosterImageView.heightAnchor.constraint(equalToConstant: 250),
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 200),
            //
            rateLabel.topAnchor.constraint(equalTo: moviePosterImageView.bottomAnchor, constant: 32),
            rateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //
            synopsisLabel.topAnchor.constraint(equalTo: rateLabel.bottomAnchor, constant: 32),
            synopsisLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            synopsisLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
}
