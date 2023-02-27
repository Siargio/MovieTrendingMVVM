//
//  DetailsMovieView.swift
//  MovieTrendingMVVM
//
//  Created by Sergio on 31.01.23.
//

import UIKit

final class DetailsMovieView: UIView {

    // MARK: - UIElements

    let imageViewDetail: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let nameMovieLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Metric.fontSizeNameMovieLabel)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let descriptionsMovieLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: Metric.fontSizeDescriptionsMovieLabel)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func addSubviews() {
        addSubview(imageViewDetail)
        addSubview(nameMovieLabel)
        addSubview(descriptionsMovieLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageViewDetail.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metric.top),
            imageViewDetail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.LeftRight),
            imageViewDetail.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metric.LeftRight),
            imageViewDetail.heightAnchor.constraint(equalTo: heightAnchor, multiplier: Metric.heightImage),

            nameMovieLabel.topAnchor.constraint(equalTo: imageViewDetail.bottomAnchor, constant: Metric.top),
            nameMovieLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.LeftRight),
            nameMovieLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metric.LeftRight),

            descriptionsMovieLabel.topAnchor.constraint(equalTo: nameMovieLabel.bottomAnchor, constant: Metric.top),
            descriptionsMovieLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.LeftRight),
            descriptionsMovieLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metric.LeftRight),
        ])
    }
}

// MARK: - Extension

extension DetailsMovieView {
    enum Metric {
        static let LeftRight: CGFloat = 20
        static let top: CGFloat = 15
        static let heightImage: CGFloat = 0.24
        static let fontSizeNameMovieLabel: CGFloat = 22
        static let fontSizeDescriptionsMovieLabel: CGFloat = 19
    }
}
