//
//  WeatherViewController.swift
//  WeatherMVVM
//
//  Created by Sargis Khachatryan on 10.09.21.
//

import Foundation
import UIKit

class WeatherViewController: UITableViewController {

    var viewModel: WeatherViewModelProtocol?
    var coordinator: WeatherCoordinatorProtool?

    lazy var segmentContol: UISegmentedControl = {
        let allItems = City.allCases.map({$0.description})
        let segmentContol = UISegmentedControl.init(items: allItems)
        segmentContol.selectedSegmentIndex = self.viewModel?.city.rawValue ?? 0
        segmentContol.addTarget(self, action: #selector(segmentContolValueChanged(_:)), for: .valueChanged)
        return segmentContol
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupRefreshControl()
        self.setupNavigationBar()
        self.tableView.refreshControl?.beginRefreshing()
    }

    private func setupRefreshControl() {
        self.tableView.refreshControl = RefreshControl.init(attributedTitle: "Update",
                                                            refreshHandler: { [weak self] in
                                                                self?.getWeatchers()
        })
    }

    private func getWeatchers() {
        self.viewModel?.fetchWeathers({ [weak self] error in
            if let error = error {
                self?.presentAlert(error.localizedDescription)
            }
        })
    }

    private func setupNavigationBar() {
        self.navigationItem.titleView = self.segmentContol
    }

    // MARK: - Action
    @objc private func segmentContolValueChanged(_ segmentContol: UISegmentedControl) {
        self.viewModel?.city = City.init(rawValue: segmentContol.selectedSegmentIndex) ?? .moscow
        self.tableView.refreshControl?.beginRefreshing()
    }
}
