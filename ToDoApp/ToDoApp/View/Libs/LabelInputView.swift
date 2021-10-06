//
//  LabelInputView.swift
//  ToDoApp
//
//  Created by Roman Manďák on 06.10.2021.
//

import Foundation
import UIKit

open class LabelInputView: UIView {

    let titleLabel = UILabel()

    var textField = UITextField()

    public init(title: String, isEditable: Bool = false) {
        super.init(frame: .zero)
        prepareView()
        titleLabel.text = title
        textField.placeholder = "Zadejte \(title)"
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func prepareView() {
        backgroundColor = .white
        prepareTitle()
        prepareValueLabel()
    }

    func prepareTitle() {
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 19).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        titleLabel.font = .systemFont(ofSize: 17, weight: .medium)
    }

    func prepareValueLabel() {
        self.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        textField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -19).isActive = true
        textField.heightAnchor.constraint(greaterThanOrEqualToConstant: 15).isActive = true
        textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true
        textField.font = .systemFont(ofSize: 15, weight: .regular)
//        textField.lineBreakMode = .byWordWrapping
    }
}
