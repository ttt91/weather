//
//  Realm+Extensions.swift
//  weather
//
//  Created by Mabo on 03/10/2016.
//  Copyright © 2016 Thanh. All rights reserved.
//

import Foundation
import RealmSwift

extension Realm {
  static func safeInstance() -> Realm {
    do {
      return try Realm()
    } catch {
      fatalError("\(error)")
    }
  }
}
