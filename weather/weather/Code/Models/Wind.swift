//
//  Wind.swift
//
//  Created by Thanh on 02/10/2016
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Wind: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kWindSpeedKey: String = "speed"
	internal let kWindDegKey: String = "deg"


    // MARK: Properties
	public var speed: Float?
	public var deg: Float?


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
		speed = json[kWindSpeedKey].float
		deg = json[kWindDegKey].float

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if speed != nil {
			dictionary.updateValue(speed!, forKey: kWindSpeedKey)
		}
		if deg != nil {
			dictionary.updateValue(deg!, forKey: kWindDegKey)
		}

        return dictionary
    }

}
