//
//  ViewController.swift
//  SimpleWeather
//
//  Created by Kay on 2022/07/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var mondayLabel: UILabel!
    @IBOutlet weak var tuesdayLabel: UILabel!
    @IBOutlet weak var wednesdayLabel: UILabel!
    @IBOutlet weak var thursdayLabel: UILabel!
    @IBOutlet weak var fridayLabel: UILabel!
    
    @IBOutlet weak var mondayImageView: UIImageView!
    @IBOutlet weak var tuesdayImageView: UIImageView!
    @IBOutlet weak var wednesdayImageView: UIImageView!
    @IBOutlet weak var thursdayImageView: UIImageView!
    @IBOutlet weak var fridayImageView: UIImageView!
    
    @IBOutlet weak var mondayTempLabel: UILabel!
    @IBOutlet weak var tuesdayTempLabel: UILabel!
    @IBOutlet weak var wednesdayTempLabel: UILabel!
    @IBOutlet weak var thursdayTempLabel: UILabel!
    @IBOutlet weak var fridayTempLabel: UILabel!
    
    @IBOutlet weak var changeButton: UIButton!

    // MARK: Data Collection
    let locations: [String] = ["Seoul", "Tokyo", "Newyork", "Manchester"]
    let weathers: [String] = ["cloud.fill", "sun.max.fill", "wind", "cloud.sun.rain.fill"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func randomTemperatureGenerator() -> String {
        return String(Int.random(in: 15..<35)) + "°"
    }
    
    func randomWeatherImageGenerator() -> UIImage {
        let imageName = weathers.randomElement()!
        let image = UIImage(systemName: imageName)?.withRenderingMode(.alwaysOriginal)
        return image!
    }
    
    @IBAction func tappedChangeButoon(_ sender: UIButton) {
        locationLabel.text = locations.randomElement()!
        weatherImageView.image = randomWeatherImageGenerator()
        temperatureLabel.text = randomTemperatureGenerator()
        
        mondayImageView.image = randomWeatherImageGenerator()
        tuesdayImageView.image = randomWeatherImageGenerator()
        wednesdayImageView.image = randomWeatherImageGenerator()
        thursdayImageView.image = randomWeatherImageGenerator()
        fridayImageView.image = randomWeatherImageGenerator()
        
        mondayTempLabel.text = randomTemperatureGenerator()
        tuesdayTempLabel.text = randomTemperatureGenerator()
        wednesdayTempLabel.text = randomTemperatureGenerator()
        thursdayTempLabel.text = randomTemperatureGenerator()
        fridayTempLabel.text = randomTemperatureGenerator()
    }

}

