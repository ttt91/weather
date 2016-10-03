//
//  Colors.swift
//  weather
//
//  Created by Mabo on 04/10/2016.
//  Copyright © 2016 Thanh. All rights reserved.
//

import Foundation
import UIKit

struct Helper {
  static  func forecastColor(index pIndex:Int) -> UIColor {
    let arrayColor = [
      UIColor(named: ColorName.Red),
      UIColor(named: ColorName.Yellow),
      UIColor(named: ColorName.Purple),
      UIColor(named: ColorName.Blue),
      ]
    return arrayColor[(pIndex % arrayColor.count)]
  }
  
  static func image(name: String) -> UIImage {
    switch name {
    case "broken clouds":
      return UIImage(asset: Asset.Broken_clouds)
    case "clear sky":
      return UIImage(asset: Asset.Clear_sky)
    case "few clouds":
      return UIImage(asset: Asset.Few_clouds)
    case "mist":
      return UIImage(asset: Asset.Mist)
    case "rain":
      return UIImage(asset: Asset.Rain)
    case "scattered clouds":
      return UIImage(asset: Asset.Scattered_clouds)
    case "shower rain":
      return UIImage(asset: Asset.Shower_rain)
    case "snow":
      return UIImage(asset: Asset.Snow)
    case "thunderstorm":
      return UIImage(asset: Asset.Thunderstorm)
    default:
      return UIImage(asset: Asset.Broken_clouds)
    }
  }
}