//
//  BaseClass.swift
//
//  Created by Thanh on 02/10/2016
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

public class Forecast: Object {
  
  // MARK: Declaration for string constants to be used to decode and also serialize.
  internal let kForecastCityKey: String = "city"
  internal let kForecastCntKey: String = "cnt"
  internal let kForecastListKey: String = "list"
  
  
  // MARK: Properties
  dynamic var city: City?
  dynamic var cnt: Int = 0
  let list = List<WeatherList>()
  
  
  // MARK: SwiftyJSON Initalizers
  /**
   Initates the class based on the object
   - parameter object: The object of either Dictionary or Array kind that was passed.
   - returns: An initalized instance of the class.
   */
  convenience public init(object: AnyObject) {
    self.init(json: JSON(object))
  }
  
  /**
   Initates the class based on the JSON that was passed.
   - parameter json: JSON object from SwiftyJSON.
   - returns: An initalized instance of the class.
   */
  public convenience init(json: JSON) {
    self.init()
    city = City(json: json[kForecastCityKey])
    if let cnt = json[kForecastCntKey].int {
      self.cnt = cnt
    }
    if let items = json[kForecastListKey].array {
      for item in items {
        list.append(WeatherList(json: item))
      }
    }
    
  }
  
  
  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
   */
  public func dictionaryRepresentation() -> [String : AnyObject ] {
    
    var dictionary: [String : AnyObject ] = [ : ]
    if city != nil {
      dictionary.updateValue(city!.dictionaryRepresentation(), forKey: kForecastCityKey)
    }
    
    dictionary.updateValue(cnt, forKey: kForecastCntKey)
    
    if list.count > 0 {
      var temp: [AnyObject] = []
      for item in list {
        temp.append(item.dictionaryRepresentation())
      }
      dictionary.updateValue(temp, forKey: kForecastListKey)
    }
    
    return dictionary
  }
  
}
