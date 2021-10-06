//
//  TaskListTVCell.swift
//  ToDoApp
//
//  Created by Roman Manďák on 28.09.2021.
//

import Foundation
import UIKit

open class TaskListTVCell: UITableViewCell {

    let wrapperView = UIView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let descriptionLabel = UILabel()
    let tagLabel = UILabel()
    let dateLabel = UILabel()

    var data: Task? {
        didSet {
            updateView()
        }
    }

    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        prepareView()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func prepareView() {
        contentView.backgroundColor = .whiteTwo
        prepareWrapper()
        prepareTitleLabel()
        prepareDisclosureIcon()
        prepareSubtitleLabel()
        prepareTagViews()
        prepareDateViews()
    }

    func prepareWrapper() {
        wrapperView.backgroundColor = .white
        wrapperView.layer.cornerRadius = 8
        contentView.addSubview(wrapperView)
        wrapperView.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        wrapperView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        wrapperView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        wrapperView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }

    func prepareTitleLabel() {
        wrapperView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 18).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        titleLabel.font = .systemFont(ofSize: 17, weight: .medium)
    }

    func prepareSubtitleLabel() {
        wrapperView.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 20).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -20).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        subtitleLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        subtitleLabel.font = .systemFont(ofSize: 13, weight: .regular)
        subtitleLabel.textColor = .lightGray
    }

    func prepareDisclosureIcon() {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.forward"))
        imageView.tintColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        wrapperView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -20).isActive = true
        imageView.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
    }

    func prepareTagViews() {
        let imageView = UIImageView(image: UIImage(systemName: "tag.fill"))
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        wrapperView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 20).isActive = true
        imageView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 14).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 14).isActive = true

        wrapperView.addSubview(tagLabel)
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        tagLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10).isActive = true
        tagLabel.trailingAnchor.constraint(equalTo: wrapperView.centerXAnchor, constant: 20).isActive = true
        tagLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        tagLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        tagLabel.font = .systemFont(ofSize: 13, weight: .regular)
        tagLabel.textColor = .gray
    }

    func prepareDateViews() {
        let imageView = UIImageView(image: UIImage(systemName: "calendar"))
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        wrapperView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: wrapperView.centerXAnchor, constant: 40).isActive = true
        imageView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 14).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 14).isActive = true

        wrapperView.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -20).isActive = true
        dateLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        dateLabel.font = .systemFont(ofSize: 13, weight: .regular)
        dateLabel.textColor = .gray
    }

    func updateView() {
        titleLabel.text = data?.title
        subtitleLabel.text = data?.description
        tagLabel.text = data?.category
        dateLabel.text = data?.date.getStringDate("d.M.Y")
    }
}
