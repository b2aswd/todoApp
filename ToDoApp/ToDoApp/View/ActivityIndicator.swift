//
//  ActivityIndicator.swift
//  ToDoApp
//
//  Created by Roman Manďák on 05.10.2021.
//

import Foundation
import UIKit

open class ActivityIndicator: UIView {

    let blurView = UIView()
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    let titleLabel = UILabel()

    public var isAnimating: Bool {
        return superview != nil
    }


    public init() {
        super.init(frame: .zero)
        prepareView()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func prepareView() {
        let color = UIColor.black
        backgroundColor = color.withAlphaComponent(0.15)

        prepareBlurView(color: color)
        prepareActivityIndicator()
        prepareTitleLabel()
    }

    func prepareBlurView(color: UIColor) {
        blurView.backgroundColor = color.withAlphaComponent(0.85)
        blurView.layer.cornerRadius = 16
        blurView.clipsToBounds = true
        addSubview(blurView)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        blurView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        blurView.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, constant: -44).isActive = true
    }

    func prepareActivityIndicator() {
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        blurView.addSubview(activityIndicator)

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerYAnchor.constraint(equalTo: blurView.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: blurView.centerXAnchor).isActive = true
        activityIndicator.leadingAnchor.constraint(greaterThanOrEqualTo: blurView.leadingAnchor, constant: 30).isActive = true
        activityIndicator.trailingAnchor.constraint(lessThanOrEqualTo: blurView.trailingAnchor, constant: -30).isActive = true
    }

    func prepareTitleLabel() {
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        blurView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: blurView.leadingAnchor, constant: 14).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: blurView.trailingAnchor, constant: -14).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.activityIndicator.bottomAnchor, constant: 15).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: blurView.bottomAnchor, constant: -15).isActive = true
    }

    func addToParent(_ parent: UIView) {
        parent.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: parent.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: parent.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive = true
    }

    open func startAnimating(title: String? = nil) {
        guard let window = UIApplication.shared.windows.last else { return }
        titleLabel.text = title
        addToParent(window)
    }

    open func stopAnimating() {
        removeFromSuperview()
    }
}
