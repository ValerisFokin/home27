//
//  DailyWeatherCell.swift
//  homeWork27
//
//  Created by Валерий Вергейчик on 29.06.22.
//

import UIKit

class DailyWeatherCell: UITableViewCell {

    @IBOutlet weak var dailyCell: UIStackView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    static let key = "DailyWeatherCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
