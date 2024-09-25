//
//  FavoriteCollectionReusableView.swift
//  Cinetopia
//
//  Created by Luiz Augusto Fernandes Gomes de Lima on 11/09/24.
//

import UIKit

class FavoriteCollectionReusableView: UICollectionReusableView {
        
    // MARK - UI Components
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .medium)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    // MARK - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK - Class methods
    
    func setupTitle(_ title: String) {
        headerLabel.text = title
    }
    
    func addSubViews() {
        addSubview(headerLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
