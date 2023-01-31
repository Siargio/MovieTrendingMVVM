//
//  MainMovieView.swift
//  MovieTrendingMVVM
//
//  Created by Sergio on 30.01.23.
//

import UIKit

class MainMovieView: UIView {

    // MARK: - UIElements

    let imageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let nameMovieLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let dataLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    func addSubviews() {
        addSubview(imageView)
        addSubview(nameMovieLabel)
        addSubview(dataLabel)
        addSubview(ratingLabel)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
            imageView.widthAnchor.constraint(equalToConstant: 100),

            nameMovieLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameMovieLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            nameMovieLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            ratingLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            ratingLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
            ratingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            dataLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            dataLabel.bottomAnchor.constraint(equalTo: ratingLabel.topAnchor, constant: -10),
            dataLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
