//
//  UIViewControllerExtension.swift
//  ToDoApp
//
//  Created by Roman Manďák on 05.10.2021.
//

import Foundation
import UIKit

public extension UIViewController {
    func presentError(message: String) {
        let alertVC = UIAlertController(title: "Chyba", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Zavřít", style: .cancel))
        self.present(alertVC, animated: true)
    }
}
