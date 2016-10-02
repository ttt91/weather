//
//  Weather.swift
//
//  Created by Thanh on 02/10/2016
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

enum Icons {
  case clear_sky
  case broken_clouds
  case few_clouds
  case mist
  case rain
  case scattered_clouds
  case shower_rain
  case snow
  case thunderstorm
}

public class Weather: Object {
  
  // MARK: Declaration for string constants to be used to decode and also serialize.
  internal let kWeatherIconKey: String = "icon"
  internal let kWeatherInternalIdentifierKey: String = "id"
  internal let kWeatherMainKey: String = "main"
  internal let kWeatherDescriptionValueKey: String = "description"
  
  
  // MARK: Properties
  dynamic var icon: String?
  dynamic var internalIdentifier: Int = 0
  dynamic var main: String?
  dynamic var descriptionValue: String?
  
  
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
    icon = json[kWeatherIconKey].string
    if let id = json[kWeatherInternalIdentifierKey].int {
      internalIdentifier = id
    }
    main = json[kWeatherMainKey].string
    descriptionValue = json[kWeatherDescriptionValueKey].string
    
  }
  
  
  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
   */
  public func dictionaryRepresentation() -> [String : AnyObject ] {
    
    var dictionary: [String : AnyObject ] = [ : ]
    if icon != nil {
      dictionary.updateValue(icon!, forKey: kWeatherIconKey)
    }
    dictionary.updateValue(internalIdentifier, forKey: kWeatherInternalIdentifierKey)
    
    if main != nil {
      dictionary.updateValue(main!, forKey: kWeatherMainKey)
    }
    if descriptionValue != nil {
      dictionary.updateValue(descriptionValue!, forKey: kWeatherDescriptionValueKey)
    }
    
    return dictionary
  }
  
}
