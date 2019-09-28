//
//  TemperatureViewController.swift
//  IOTAssignment2
//
//  Created by Ojas Chimane on 28/9/19.
//  Copyright © 2019 Ojas Chimane Org. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import Lottie

class TemperatureViewController: UIViewController,CLLocationManagerDelegate {
    
    var locationManager:CLLocationManager?
    var currentLocation:CLLocationCoordinate2D?
    let API_KEY = "a14a90e12193f174eaeeee5c31274bac"
    @IBOutlet weak var outsideTemperatureAnimationView: AnimationView!
    @IBOutlet weak var outsideTemperatureLabel: UILabel!
    @IBOutlet weak var weatherConditionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup location manager to get user location
        locationManager = CLLocationManager()
        locationManager!.delegate = self;
        locationManager!.desiredAccuracy = kCLLocationAccuracyBest
        locationManager!.requestAlwaysAuthorization()
        locationManager!.startUpdatingLocation()
    }
    
    private func getAlamoWeatherData(successCompletion: @escaping (Float,String) -> (), errorCompletion: @escaping () -> ()) {
        Alamofire.request("https://samples.openweathermap.org/data/2.5/weather",
                          method: .get,
                          parameters: ["lat": currentLocation!.latitude,"lon":currentLocation!.longitude,"appid":API_KEY])
            .validate()
            .responseJSON { response in
                debugPrint(response)
                
                if let data = response.result.value{
                    let json = data as! NSDictionary
                    print("JSON:",json)
                    let main = json.object(forKey: "main") as! NSDictionary
                    let weatherData = json.object(forKey: "weather") as! [[String:Any]]
                    var weatherStatus = ""
                    for weather in weatherData{
                        weatherStatus = weather["description"] as! String
                        print("temp W#", weatherStatus)
                    }

                    if let temp = main.value(forKey: "temp") as? NSNumber {
                        let current_temp = temp.floatValue
                        print("temp:# ",current_temp)
                        successCompletion(current_temp - 273.15,weatherStatus)
                    }
                }
    
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let locValue = locations.first
        {
            print("locations = \(locValue.coordinate.latitude) \(locValue.coordinate.longitude)")
            self.currentLocation = locValue.coordinate
            // getWeatherData()
            getAlamoWeatherData(successCompletion: { temp,condition  in
                let currentTemperature = Int(temp)
                print("Temperaturee: " ,currentTemperature)
                print("condition:",condition)
                let trimmedCondition = condition.trimmingCharacters(in: .whitespacesAndNewlines)
                DispatchQueue.main.async {
                    self.weatherConditionLabel.text = trimmedCondition
                    self.playOutsideWheatherAnimation(weatherCondition: trimmedCondition)
                    self.outsideTemperatureLabel.text = String(currentTemperature)+"°"
                }
                
            }) {
                print("Error grabbing data")
            }
            
        }
        self.locationManager?.stopUpdatingLocation()
        
    }
    
    private func playOutsideWheatherAnimation(weatherCondition:String) {
        let animation:Animation?
        
        switch weatherCondition {
        case "few clouds":
            animation = Animation.named("partly-cloudy")
        case "clear sky":
            animation = Animation.named("weather-sunny")
        case "rain":
            animation = Animation.named("shower")
        case "thunderstorm":
            animation = Animation.named("weather-storm")
        default:
            animation = Animation.named("weather-sunny")
        }

          outsideTemperatureAnimationView.animation = animation
          outsideTemperatureAnimationView.contentMode = .scaleAspectFit
          outsideTemperatureAnimationView.loopMode = .loop
          outsideTemperatureAnimationView.play()
          
      }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
