//
//  TaskListVC.swift
//  ToDoApp
//
//  Created by Roman Manďák on 27.09.2021.
//

import Foundation
import UIKit

open class TaskListVC: UITableViewController {

    public var dataSource = ApiTaskRepository()

    public var data: [Task] = [] {
        didSet {
            tableView.reloadData()
        }
    }

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
        getApiData()
    }

    func getApiData() {
        tableView.refreshControl?.beginRefreshing()
        dataSource.getTasks { [weak self] result in
            DispatchQueue.main.async {
                self?.tableView.refreshControl?.endRefreshing()
                switch result {
                case .success(let data):
                    self?.data = data
                case .failure(let error):
                    self?.presentError(message: error.localizedDescription)
                }
            }
        }
    }

    func prepareTableView() {
        tableView.register(TaskListTVCell.self, forCellReuseIdentifier: TaskListTVCell.description())
        tableView.rowHeight = 120
        tableView.separatorStyle = .none
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refreshControlActived), for: .valueChanged)
    }

    open override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskListTVCell.description(), for: indexPath) as? TaskListTVCell else {
            return UITableViewCell()
        }
        cell.data = data[indexPath.row]
        return cell
    }

    open override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TaskDetailVC()
        vc.data = data[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func addTapped() {
        let createVC = TaskCreateVC()
        let navigationController = UINavigationController(rootViewController: createVC)
        self.present(navigationController, animated: true)
    }

    @objc func refreshControlActived() {
        print("should refresh data")
        tableView.refreshControl?.endRefreshing()
    }

}
