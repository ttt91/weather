//
//  Main.swift
//
//  Created by Thanh on 02/10/2016
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

public class Main: Object {
  
  // MARK: Declaration for string constants to be used to decode and also serialize.
  internal let kMainTempKfKey: String = "temp_kf"
  internal let kMainTempMinKey: String = "temp_min"
  internal let kMainTempKey: String = "temp"
  internal let kMainGrndLevelKey: String = "grnd_level"
  internal let kMainHumidityKey: String = "humidity"
  internal let kMainSeaLevelKey: String = "sea_level"
  internal let kMainTempMaxKey: String = "temp_max"
  internal let kMainPressureKey: String = "pressure"
  
  
  // MARK: Properties
  dynamic var tempKf: Int = 0
  dynamic var tempMin: Float = 0
  dynamic var temp: Float = 0
  dynamic var grndLevel: Float = 0
  dynamic var humidity: Int = 0
  dynamic var seaLevel: Float = 0
  dynamic var tempMax: Float = 0
  dynamic var pressure: Float = 0
  
  
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
    if let tempKf = json[kMainTempKfKey].int,
      tempMin = json[kMainTempMinKey].float,
      temp = json[kMainTempKey].float,
      grndLevel = json[kMainGrndLevelKey].float,
      humidity = json[kMainHumidityKey].int,
      seaLevel = json[kMainSeaLevelKey].float,
      tempMax = json[kMainTempMaxKey].float,
      pressure = json[kMainPressureKey].float {
      
      self.tempKf = tempKf
      self.tempMin = tempMin
      self.temp = temp
      self.grndLevel = grndLevel
      self.humidity = humidity
      self.seaLevel = seaLevel
      self.tempMax = tempMax
      self.pressure = pressure
    }
    
  }
  
  
  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
   */
  public func dictionaryRepresentation() -> [String : AnyObject ] {
    
    var dictionary: [String : AnyObject ] = [ : ]
    dictionary.updateValue(tempKf, forKey: kMainTempKfKey)
    dictionary.updateValue(tempMin, forKey: kMainTempMinKey)
    dictionary.updateValue(temp, forKey: kMainTempKey)
    dictionary.updateValue(grndLevel, forKey: kMainGrndLevelKey)
    dictionary.updateValue(humidity, forKey: kMainHumidityKey)
    dictionary.updateValue(seaLevel, forKey: kMainSeaLevelKey)
    dictionary.updateValue(tempMax, forKey: kMainTempMaxKey)
    dictionary.updateValue(pressure, forKey: kMainPressureKey)
    
    return dictionary
  }
  
}
