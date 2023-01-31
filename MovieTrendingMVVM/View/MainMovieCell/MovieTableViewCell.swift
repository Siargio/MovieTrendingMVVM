//
//  MovieTableViewCell.swift
//  MovieTrendingMVVM
//
//  Created by Sergio on 30.01.23.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {

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
        label.font = .systemFont(ofSize: 15)
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
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            imageViewCell.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 6),
            imageViewCell.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 6),
            imageViewCell.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -6),
            imageViewCell.widthAnchor.constraint(equalToConstant: 110),

            nameMovieLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 6),
            nameMovieLabel.leadingAnchor.constraint(equalTo: imageViewCell.trailingAnchor, constant: 10),
            nameMovieLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -6),

            ratingLabel.leadingAnchor.constraint(equalTo: imageViewCell.trailingAnchor, constant: 10),
            ratingLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -6),
            ratingLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -6),

            dataLabel.leadingAnchor.constraint(equalTo: imageViewCell.trailingAnchor, constant: 10),
            dataLabel.bottomAnchor.constraint(equalTo: ratingLabel.topAnchor, constant: -5),
            dataLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -6)
        ])
    }
 }
