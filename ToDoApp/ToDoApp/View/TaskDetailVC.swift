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
    public var dateLabelView = LabelValueView(title: "Datum")
    public var categoryLabelView = LabelValueView(title: "Kategorie")
    public var descriptionLabelView = LabelValueView(title: "Popis")

    public var activityIndicator = ActivityIndicator()

    public var dataSource = ApiTaskRepository()
    public var completedButton: UIBarButtonItem?

    open override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        self.title = "Detail úkolu"


    }

    func prepareView() {
        prepareNavigationBarBtn()
        view.backgroundColor = .whiteTwo
        prepareView(titleLabelView, topAnchor: view.layoutMarginsGuide.topAnchor, offset: 0)
        prepareView(dateLabelView, topAnchor: titleLabelView.bottomAnchor)
        prepareView(categoryLabelView, topAnchor: dateLabelView.bottomAnchor)
        prepareView(descriptionLabelView, topAnchor: categoryLabelView.bottomAnchor)
        descriptionLabelView.setValueMultiline(true)
        titleLabelView.valueLabel.text = data?.title
        dateLabelView.valueLabel.text = data?.date.getStringDate("d.M.Y")
        categoryLabelView.valueLabel.text = data?.category
        descriptionLabelView.valueLabel.text = data?.description
        updateCompletedBtn()
    }

    func prepareNavigationBarBtn() {
        let tempCompletedbutton = UIBarButtonItem.init(image: UIImage(systemName: "checkmark.square"),
                                          style: .plain,
                                          target: self,
                                          action: #selector(completedTapped))
        completedButton = tempCompletedbutton
        self.navigationItem.rightBarButtonItems =
            [
                UIBarButtonItem.init(barButtonSystemItem: .trash,
                                     target: self,
                                     action: #selector(trashTapped)),
                tempCompletedbutton
            ]
    }

    func prepareView(_ labelValueView: LabelValueView, topAnchor: NSLayoutYAxisAnchor, offset: CGFloat = 1) {
        view.addSubview(labelValueView)
        labelValueView.translatesAutoresizingMaskIntoConstraints = false
        labelValueView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        labelValueView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        labelValueView.topAnchor.constraint(equalTo: topAnchor ,constant: offset).isActive = true
    }

    @objc func trashTapped() {
        self.activityIndicator.startAnimating()
    }

    @objc func completedTapped() {
        print("completed tapped")
        guard var dataUnwrapped = data else { return }
        self.activityIndicator.startAnimating()
        let isCompleted = data?.isCompleted ?? false
        dataUnwrapped.isCompleted = !isCompleted
        dataSource.updateTask(task: dataUnwrapped, completionHandler: { [weak self] result in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                switch result {
                case .success(let data):
                    self?.data?.isCompleted = data.isCompleted
                    self?.updateCompletedBtn()
                case .failure(let error):
                    self?.presentError(message: error.localizedDescription)
                }
            }
        })
    }

    func updateCompletedBtn() {
        self.completedButton?.image = (data?.isCompleted == true) ? UIImage(systemName: "checkmark.square") : UIImage(systemName: "square")
    }

}
