//
//  List.swift
//
//  Created by Thanh on 02/10/2016
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

public class WeatherList: Object {
  
  // MARK: Declaration for string constants to be used to decode and also serialize.
  internal let kListDtTxtKey: String = "dt_txt"
  internal let kListWeatherKey: String = "weather"
  internal let kListWindKey: String = "wind"
  internal let kListMainKey: String = "main"
  
  
  // MARK: Properties
  dynamic var dtTxt: String?
  dynamic var date: NSDate?
  let weather = List<Weather>()
  dynamic var wind: Wind?
  dynamic var main: Main?
  
  
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
    dtTxt = json[kListDtTxtKey].string
    
    if let dtText = dtTxt {
      let dateFormatter = NSDateFormatter()
      dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
      date = dateFormatter.dateFromString(dtText)
      
    }
    
    if let items = json[kListWeatherKey].array {
      for item in items {
        weather.append(Weather(json: item))
      }
    }
    wind = Wind(json: json[kListWindKey])
    main = Main(json: json[kListMainKey])
    
  }
  
  
  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
   */
  public func dictionaryRepresentation() -> [String : AnyObject ] {
    
    var dictionary: [String : AnyObject ] = [ : ]
    if dtTxt != nil {
      dictionary.updateValue(dtTxt!, forKey: kListDtTxtKey)
    }
    if weather.count > 0 {
      var temp: [AnyObject] = []
      for item in weather {
        temp.append(item.dictionaryRepresentation())
      }
      dictionary.updateValue(temp, forKey: kListWeatherKey)
    }
    if wind != nil {
      dictionary.updateValue(wind!.dictionaryRepresentation(), forKey: kListWindKey)
    }
    if main != nil {
      dictionary.updateValue(main!.dictionaryRepresentation(), forKey: kListMainKey)
    }
    
    return dictionary
  }
  
}
