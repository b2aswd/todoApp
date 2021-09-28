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
    let descriptionLabel = UILabel()
    //TODO

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
        //TODO
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

    func updateView() {
        titleLabel.text = data?.title
        //TODO
    }
}
