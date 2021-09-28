//
//  TaskListVC.swift
//  ToDoApp
//
//  Created by Roman Manďák on 27.09.2021.
//

import Foundation
import UIKit

open class TaskListVC: UITableViewController {

    public var dataSource = MockTaskRepository()

    open override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }

    func prepareView() {
        self.title = "Seznam úkolů"
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        view.backgroundColor = .whiteTwo
        tableView.backgroundColor = view.backgroundColor
        prepareTableView()
    }

    func prepareTableView() {
        tableView.register(TaskListTVCell.self, forCellReuseIdentifier: TaskListTVCell.description())
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
    }

    open override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.getTasks().count
    }

    open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskListTVCell.description(), for: indexPath) as? TaskListTVCell else {
            return UITableViewCell()
        }
        cell.data = dataSource.getTasks()[indexPath.row]
        return cell
    }

    open override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TaskDetailVC()
        vc.data = dataSource.getTasks()[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func addTapped() {
        
    }

}
