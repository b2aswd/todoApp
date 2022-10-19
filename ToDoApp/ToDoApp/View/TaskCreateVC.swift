//
//  TaskCreateVC.swift
//  ToDoApp
//
//  Created by Roman Manďák on 06.10.2021.
//

import Foundation
import UIKit

open class TaskCreateVC: UIViewController {

    public var dataSource = ApiTaskRepository()

    public var titleLabelInput = LabelInputView(title: "Název")
    public var dateLabelInput = LabelDateInputView(title: "Datum")
    public var categoryLabelInput = LabelInputView(title: "Kategorie")
    public var descriptionLabelInput = LabelInputView(title: "Popis")

    open override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }

    func prepareView() {
        view.backgroundColor = .whiteTwo
        self.title = "Nový úkol"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .close, target: self, action: #selector(closeBtnTapped))
        prepareView(titleLabelInput, topAnchor: view.layoutMarginsGuide.topAnchor, offset: 0)
        prepareView(dateLabelInput, topAnchor: titleLabelInput.bottomAnchor)
        prepareView(categoryLabelInput, topAnchor: dateLabelInput.bottomAnchor)
        prepareView(descriptionLabelInput, topAnchor: categoryLabelInput.bottomAnchor)
        prepareButton()
    }

    func prepareButton() {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .customBlue
        button.setTitle("Vytvořit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 55).isActive = true
        button.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 0).isActive = true
        button.addTarget(self, action: #selector(createBtnTapped), for: .touchUpInside)
    }

    func prepareView(_ labelValueView: UIView, topAnchor: NSLayoutYAxisAnchor, offset: CGFloat = 1) {
        view.addSubview(labelValueView)
        labelValueView.translatesAutoresizingMaskIntoConstraints = false
        labelValueView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        labelValueView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        labelValueView.topAnchor.constraint(equalTo: topAnchor ,constant: offset).isActive = true
    }

    @objc func closeBtnTapped() {
        self.dismiss(animated: true)
    }

    @objc func createBtnTapped() {
        
    }
}
