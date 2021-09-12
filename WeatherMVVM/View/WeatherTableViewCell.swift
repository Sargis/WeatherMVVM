//
//  WeatherTableViewCell.swift
//  WeatherMVVM
//
//  Created by Sargis Khachatryan on 11.09.21.
//

import Foundation
import UIKit

class WeatherTableViewCell: UITableViewCell {

    lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "sun")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    lazy var dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initalized()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(_ data: Data) {
        self.temperatureLabel.text = "\(data.temperatureMin)C"
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "E, d MMM"
        let date = Date.init(timeIntervalSince1970: data.time)
        self.dateLabel.text = dateFormatter.string(from: date)
    }

    private func initalized() {
        self.contentView.addSubview(weatherImageView, anchors: [
                                        .centerY(self.contentView.centerYAnchor),
                                        .top(self.contentView.topAnchor, 30),
                                        .leading(self.contentView.leadingAnchor, 30)
        ])

        self.contentView.addSubview(self.temperatureLabel, anchors: [
            .leading(self.weatherImageView.trailingAnchor, 20),
            .centerY(self.weatherImageView.centerYAnchor)
        ])

        self.contentView.addSubview(self.dateLabel, anchors: [
            .centerY(self.centerYAnchor),
            .trailing(self.trailingAnchor, -20)
        ])
    }
}
