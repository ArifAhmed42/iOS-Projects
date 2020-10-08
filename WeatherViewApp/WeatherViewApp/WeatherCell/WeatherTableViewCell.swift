//
//  WeatherTableViewCell.swift
//  WeatherViewApp
//
//  Created by SM Arif Ahmed on 3/10/20.
//  Copyright © 2020 SM Arif Ahmed. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var holdingView: UIView!
    @IBOutlet weak var lowTemperatureLabel: UILabel!
    @IBOutlet weak var highTemperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static let identifier = "WeatherTableViewCell"
       static func nib() -> UINib {
           return UINib(nibName: "WeatherTableViewCell", bundle: nil)
       }
    
    func configure(with model: DailyWeatherEntry){
        
        let  lowTempinCelsius: Float = Float((model.temperatureLow - 32) * 5/9)
        let  highTempinCelsius: Float = Float((model.temperatureHigh - 32) * 5/9)
        
        self.lowTemperatureLabel.text = "\(Int(lowTempinCelsius))°C"
        self.highTemperatureLabel.text = "\(Int(highTempinCelsius))°C"
        self.dayLabel.text = getDayforDate(Date(timeIntervalSince1970: Double(model.time)))

       
        let icon = model.icon.lowercased()
        if icon.contains("clear"){
            self.iconImageView.image = UIImage(named: "clear")
            setImageStyle()
        }
        else if icon.contains("rain"){
            self.iconImageView.image = UIImage(named: "rain")
              setImageStyle()
        }
        else{
            //We will use the cloud icon
            self.iconImageView.image = UIImage(named: "cloud")
              setImageStyle()
        }
        
        self.holdingView.backgroundColor = UIColor(red: 52/255.0, green: 109/255.0, blue: 179/255.0, alpha: 1.0)
        
        
    }
    
    func setImageStyle(){
            iconImageView.layer.shadowColor = UIColor.darkGray.cgColor
               iconImageView.layer.shadowOffset = CGSize(width: 2, height: 3);
               iconImageView.layer.shadowOpacity = 1;
               iconImageView.layer.shadowRadius = 1.0;
               iconImageView.clipsToBounds = false;
    }
    
    func getDayforDate(_ date:Date?)-> String{
        guard let inputDate = date else {
            return ""
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: inputDate)
    }
    
}
