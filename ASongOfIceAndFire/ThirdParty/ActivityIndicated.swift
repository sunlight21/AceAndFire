//
//  ActivityIndicated.swift
//
//

import UIKit

struct IndicatorItem {

    // MARK: - Constants
    fileprivate let barOffset: CGFloat = -44.0

    // MARK: - Properties

    let style: UIActivityIndicatorViewStyle = .whiteLarge

    fileprivate weak var view: UIView?
    private var color: UIColor?

    private(set) weak var indicator: UIActivityIndicatorView? {
        willSet {
            indicator?.removeFromSuperview()
        }
        didSet {
            if let activityIndicator = indicator, let view = self.view {
                activityIndicator.color = color ?? .white
                view.addSubview(activityIndicator)
                activityIndicator.translatesAutoresizingMaskIntoConstraints = false
                activityIndicator.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
                activityIndicator.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor, constant: barOffset).isActive = true
                activityIndicator.startAnimating()
            }
        }
    }

    init(view: UIView, color: UIColor? = nil) {
        self.view = view
        self.color = color
    }

    mutating func make(visible: Bool) {
        indicator = visible ? UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge) : nil
        view?.isUserInteractionEnabled = !visible
    }
}

protocol ActivityIndicated {
    var indicator: IndicatorItem? { get set }
}
