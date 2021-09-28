//
//  TaskDetailVC.swift
//  ToDoApp
//
//  Created by Roman Manďák on 26.09.2021.
//

import Foundation
import UIKit

open class TaskDetailVC: UIViewController {

    public var data: Task?

    public var titleLabelView = LabelValueView(title: "Název")

    open override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        self.title = "Detail úkolu"
        self.navigationItem.setRightBarButtonItems(
            [
                UIBarButtonItem.init(barButtonSystemItem: .trash, target: self, action: #selector(trashTapped)),
                UIBarButtonItem.init(image: UIImage(systemName: "checkmark.square"), style: .plain, target: self, action: #selector(favoriteTapped))],
            animated: false)
    }

    func prepareView() {
        view.backgroundColor = .whiteTwo
        prepareTitleView()
    }

    func prepareTitleView() {
        view.addSubview(titleLabelView)
        titleLabelView.translatesAutoresizingMaskIntoConstraints = false
        titleLabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        titleLabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        titleLabelView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        titleLabelView.heightAnchor.constraint(equalToConstant: 88).isActive = true
        titleLabelView.valueTextField.text = data?.title
    }

    @objc func trashTapped() {

    }

    @objc func favoriteTapped() {

    }

}
