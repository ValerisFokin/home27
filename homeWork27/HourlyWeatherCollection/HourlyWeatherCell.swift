//
//  HourlyWeatherCell.swift
//  homeWork27
//
//  Created by Валерий Вергейчик on 29.06.22.
//

import UIKit

class HourlyWeatherCell: UICollectionViewCell {
    
    @IBOutlet weak var hourlyWeatherImage: UIImageView!
    @IBOutlet weak var hourlyWeatherLabel: UILabel!
    
    static let key = "HourlyWeatherCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
