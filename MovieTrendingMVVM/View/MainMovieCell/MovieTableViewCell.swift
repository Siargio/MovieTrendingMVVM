//
//  MovieTableViewCell.swift
//  MovieTrendingMVVM
//
//  Created by Sergio on 30.01.23.
//

import UIKit
import SDWebImage

final class MovieTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    static let identifier = "MovieTableViewCell"

    // MARK: - UIElements

    let containerView: UIView = {
        let image = UIView()
        image.backgroundColor = .systemGray5
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let imageViewCell: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let nameMovieLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: Metric.sizeNameMovieLabel)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let dataLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Metric.sizeNameDataLabel)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Metric.sizeNameRatingLabel)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //MARK: - LifeCycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        containerView.addBorder(color: .lightGray, width: 1)
        containerView.round()
        addSubviews()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    func setupCell(viewModel: MovieTableCellViewModel) {
        self.nameMovieLabel.text = viewModel.name
        self.dataLabel.text = viewModel.date
        self.ratingLabel.text = viewModel.score
        self.imageViewCell.sd_setImage(with: viewModel.image)
    }

    func addSubviews() {
        addSubview(containerView)
        addSubview(imageViewCell)
        addSubview(nameMovieLabel)
        addSubview(dataLabel)
        addSubview(ratingLabel)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: Metric.topBottom),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.LeftRight),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metric.topBottom),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metric.LeftRight),

            imageViewCell.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Metric.trailingLeadingBottomTop),
            imageViewCell.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Metric.trailingLeadingBottomTop),
            imageViewCell.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -Metric.trailingLeadingBottomTop),
            imageViewCell.widthAnchor.constraint(equalTo: widthAnchor, multiplier: Metric.imageWidth),

            nameMovieLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Metric.trailingLeadingBottomTop),
            nameMovieLabel.leadingAnchor.constraint(equalTo: imageViewCell.trailingAnchor, constant: Metric.trailing),
            nameMovieLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Metric.trailingLeadingBottomTop),

            ratingLabel.leadingAnchor.constraint(equalTo: imageViewCell.trailingAnchor, constant: Metric.trailing),
            ratingLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -Metric.trailingLeadingBottomTop),
            ratingLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Metric.trailingLeadingBottomTop),

            dataLabel.leadingAnchor.constraint(equalTo: imageViewCell.trailingAnchor, constant: Metric.trailing),
            dataLabel.bottomAnchor.constraint(equalTo: ratingLabel.topAnchor, constant: -Metric.topBottom),
            dataLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Metric.trailingLeadingBottomTop)
        ])
    }
 }

// MARK: - Extension

extension MovieTableViewCell {
    enum Metric {
        static let LeftRight: CGFloat = 20
        static let topBottom: CGFloat = 5
        static let imageWidth: CGFloat = 0.27
        static let trailing: CGFloat = 10
        static let trailingLeadingBottomTop: CGFloat = 6

        static let sizeNameMovieLabel: CGFloat = 18
        static let sizeNameDataLabel: CGFloat = 17
        static let sizeNameRatingLabel: CGFloat = 15
    }
}
