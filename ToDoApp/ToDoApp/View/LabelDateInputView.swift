//
//  LabelDateInputView.swift
//  ToDoApp
//
//  Created by Roman Manďák on 06.10.2021.
//

import Foundation
import UIKit

open class LabelDateInputView: UIView {
    let titleLabel = UILabel()

    var datePicker = UIDatePicker()

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
        self.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        datePicker.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -19).isActive = true
        datePicker.heightAnchor.constraint(greaterThanOrEqualToConstant: 15).isActive = true
        datePicker.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true
        datePicker.datePickerMode = .date
    }

}

