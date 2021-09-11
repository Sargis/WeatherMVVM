//
//  RefreshControl.swift
//  WeatherMVVM
//
//  Created by Sargis Khachatryan on 10.09.21.
//

import UIKit

final class RefreshControl: UIRefreshControl {

    private var refreshHandler: () -> Void

    // MARK: - Initializers

    init(attributedTitle: String = "",
         backgroundColor: UIColor? = .clear,
         refreshHandler: @escaping () -> Void) {
        self.refreshHandler = refreshHandler
        super.init()
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
        self.attributedTitle = NSAttributedString(string: attributedTitle)
        addTarget(self, action: #selector(refreshControlAction), for: .valueChanged)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("required init dosn't supported")
    }

    // MARK: - Selectors
    @objc func refreshControlAction() {
        refreshHandler()
    }
}
