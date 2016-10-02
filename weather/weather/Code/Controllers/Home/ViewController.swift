//
//  ViewController.swift
//  weather
//
//  Created by Mabo on 02/10/2016.
//  Copyright © 2016 Thanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    self.loadWeather()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

// MARK: Network part
extension ViewController {
  func loadWeather(city:String = "Paris,fr", days:Int = 5) {
    WeatherServices.sharedInstance.weathers(forCity: city, andDays: days) { (city, result, error) -> Void in
      if let error = error {
        print(error)
      } else {
        print(result?.dictionaryRepresentation())
      }
    }
  }
}

