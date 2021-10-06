//
//  LabelValueView.swift
//  ToDoApp
//
//  Created by Roman Manďák on 28.09.2021.
//

import Foundation
import UIKit

open class LabelValueView: UIView {

    let titleLabel = UILabel()

    let valueLabel = UILabel()

    public init(title: String, isEditable: Bool = false) {
        super.init(frame: .zero)
        prepareView()
        titleLabel.text = title
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
        self.addSubview(valueLabel)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        valueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        valueLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -19).isActive = true
        valueLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 15).isActive = true
        valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true
        valueLabel.font = .systemFont(ofSize: 17, weight: .regular)
        valueLabel.lineBreakMode = .byWordWrapping
    }

    func setValueMultiline(_ multiline: Bool) {
        valueLabel.numberOfLines = multiline ? 0 : 1
    }
}
