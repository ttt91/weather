//
//  Float+Extensions.swift
//  weather
//
//  Created by Mabo on 04/10/2016.
//  Copyright © 2016 Thanh. All rights reserved.
//

import Foundation

extension Float {
  func format(f: String) -> String {
    return String(format: "%\(f)f", self)
  }
}