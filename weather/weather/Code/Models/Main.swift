//
//  Main.swift
//
//  Created by Thanh on 02/10/2016
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Main: NSObject {

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
	public var tempKf: Int?
	public var tempMin: Float?
	public var temp: Float?
	public var grndLevel: Float?
	public var humidity: Int?
	public var seaLevel: Float?
	public var tempMax: Float?
	public var pressure: Float?


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
		tempKf = json[kMainTempKfKey].int
		tempMin = json[kMainTempMinKey].float
		temp = json[kMainTempKey].float
		grndLevel = json[kMainGrndLevelKey].float
		humidity = json[kMainHumidityKey].int
		seaLevel = json[kMainSeaLevelKey].float
		tempMax = json[kMainTempMaxKey].float
		pressure = json[kMainPressureKey].float

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if tempKf != nil {
			dictionary.updateValue(tempKf!, forKey: kMainTempKfKey)
		}
		if tempMin != nil {
			dictionary.updateValue(tempMin!, forKey: kMainTempMinKey)
		}
		if temp != nil {
			dictionary.updateValue(temp!, forKey: kMainTempKey)
		}
		if grndLevel != nil {
			dictionary.updateValue(grndLevel!, forKey: kMainGrndLevelKey)
		}
		if humidity != nil {
			dictionary.updateValue(humidity!, forKey: kMainHumidityKey)
		}
		if seaLevel != nil {
			dictionary.updateValue(seaLevel!, forKey: kMainSeaLevelKey)
		}
		if tempMax != nil {
			dictionary.updateValue(tempMax!, forKey: kMainTempMaxKey)
		}
		if pressure != nil {
			dictionary.updateValue(pressure!, forKey: kMainPressureKey)
		}

        return dictionary
    }

}
