//
//  City.swift
//
//  Created by Thanh on 02/10/2016
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class City: NSObject {
  
  // MARK: Declaration for string constants to be used to decode and also serialize.
  internal let kCityCountryKey: String = "country"
  internal let kCityNameKey: String = "name"
  
  
  // MARK: Properties
  public var country: String?
  public var name: String?
  
  
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
  public init(json: JSON) {
    country = json[kCityCountryKey].string
    name = json[kCityNameKey].string
    
  }
  
  
  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
   */
  public func dictionaryRepresentation() -> [String : AnyObject ] {
    
    var dictionary: [String : AnyObject ] = [ : ]
    if country != nil {
      dictionary.updateValue(country!, forKey: kCityCountryKey)
    }
    if name != nil {
      dictionary.updateValue(name!, forKey: kCityNameKey)
    }
    
    return dictionary
  }
  
}
