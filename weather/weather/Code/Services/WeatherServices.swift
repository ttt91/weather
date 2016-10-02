//
//  WeatherServices.swift
//  weather
//
//  Created by Mabo on 02/10/2016.
//  Copyright © 2016 Thanh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class WeatherServices: NSObject {
  
  static let sharedInstance = WeatherServices()
  private let afManager = Alamofire.Manager(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
  private let apiKey = "65524104a8e83add12e1c8edb01c6d19"
  
  func weathers(forCity city:String = "Paris,fr", andDays days:Int = 5,
                        completion:(city:String?, result:Forecast?, error:NSError?) -> Void) -> Void {
    
    let url = NSURL(string: "http://api.openweathermap.org/data/2.5/forecast")!
    let parameters:[String:AnyObject] = ["q":city, "units":"metric", "appid":self.apiKey]
    
    self.afManager.request(.GET, url, parameters:parameters, encoding: .URL, headers: nil)
      .validate()
      .responseJSON { response in
        switch response.result {
        case .Success:
          if let value = response.result.value {
            
            let json = JSON(value)
            if let code = json["code"].int where code != 200 {
              let error = NSError(domain: "WheatherServices",
                code: code,
                userInfo: [NSLocalizedDescriptionKey:json["message"].stringValue])
              completion(city:nil, result: nil, error: error)
            } else {
              let forecast = Forecast(json: json)
              completion(city:city, result: forecast, error: nil)
            }
          }
        case .Failure(let error):
          completion(city:nil, result: nil, error: error)
        }
    }
  }
  
}
