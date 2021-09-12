//
//  WeatherViewController.swift
//  WeatherMVVM
//
//  Created by Sargis Khachatryan on 10.09.21.
//

import Foundation
import UIKit

class WeatherViewController: UITableViewController {

    private static var cellIdentifier = "cell"

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
        self.setup()
        self.tableView.refreshControl?.beginRefreshing()
        self.getWeatchers()
    }

    private func getWeatchers() {
        self.viewModel?.fetchWeathers({ [weak self] error in
            if let error = error {
                self?.presentAlert(error.localizedDescription)
            } else {
                self?.tableView.refreshControl?.endRefreshing()
                self?.tableView.reloadData()
            }
        })
    }

    private func setup() {
        self.tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: Self.cellIdentifier)
        self.navigationItem.titleView = self.segmentContol
        self.tableView.refreshControl = RefreshControl.init(attributedTitle: "Update",
                                                            refreshHandler: { [weak self] in
                                                                self?.getWeatchers()
        })
    }

    // MARK: - Action
    @objc private func segmentContolValueChanged(_ segmentContol: UISegmentedControl) {
        self.viewModel?.city = City.init(rawValue: segmentContol.selectedSegmentIndex) ?? .moscow
        self.tableView.reloadSections([0], with: .automatic)
        self.tableView.refreshControl?.beginRefreshing()
        self.getWeatchers()
    }
}

// MARK: - WeatherViewController
extension WeatherViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel?.weather?.daily.data.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellIdentifier,
                                                       for: indexPath) as? WeatherTableViewCell else {
            fatalError("cell has not been initalized")
        }
        let data = self.viewModel!.weather!.daily.data[indexPath.row]
        cell.update(data)
        return cell
    }
}
