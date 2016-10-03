//
//  DataFetcher.swift
//  weather
//
//  Created by Mabo on 03/10/2016.
//  Copyright © 2016 Thanh. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

struct WeatherItem {
  var date: NSDate?
  var icon: String?
  var windSpeed: Float?
  var description: String?
  var tempMorning: Float?
  var tempAfternoon: Float?
  var humidity: Int?
}

struct DataFetcher {
  
  func data(forecast: Forecast, days: Int) -> [WeatherItem] {
    var items = [WeatherItem]()
    
    for day in 0..<days {
      items.append(getItem(forecast.list, day: day))
    }
    
    return items
  }
  
  func getItem(weatherList: List<WeatherList>, day: Int) -> WeatherItem {
    let morningForecast = getMorning(weatherList, day: day)
    let afternoonForecast = getAfternoon(weatherList, day: day)
    
    var weatherItem = WeatherItem()
    
    if let morning = morningForecast {
      weatherItem.date = morning.date
      weatherItem.icon = morning.weather.first?.icon
      weatherItem.windSpeed = morning.wind?.speed
      weatherItem.description = morning.weather.first?.descriptionValue?.capitalizedString
      weatherItem.humidity = morning.main?.humidity
      weatherItem.tempMorning = morning.main?.temp
    }
    
    if let afternoon = afternoonForecast {
      weatherItem.date = afternoon.date
      weatherItem.icon = afternoon.weather.first?.icon
      weatherItem.windSpeed = afternoon.wind?.speed
      weatherItem.description = afternoon.weather.first?.descriptionValue?.capitalizedString
      weatherItem.humidity = afternoon.main?.humidity
      weatherItem.tempAfternoon = afternoon.main?.temp
    }
    
    return weatherItem
  }
  
  func getMorning(weatherList: List<WeatherList>, day: Int) -> WeatherList? {
    let date = NSDate()
    let searchedDate = NSCalendar.currentCalendar()
      .dateByAddingUnit(
        .Day,
        value: day,
        toDate: date,
        options: []
    )
    if let sDate = searchedDate {
      let cal: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
      let components = cal.components([.Year, .Month, .Day, .Hour, .Minute, .Second], fromDate: sDate)
      
      // Check if date at 09:00:00 exists
      components.hour = 9
      components.minute = 00
      components.second = 0
      
      let newDate = cal.dateFromComponents(components)!
      let filteredList = weatherList.filter { $0.date == newDate }
      if filteredList.count != 0 {
        return filteredList.first
      }
    }
    
    return nil
  }
  
  func getAfternoon(weatherList: List<WeatherList>, day: Int) -> WeatherList? {
    let date = NSDate()
    let searchedDate = NSCalendar.currentCalendar()
      .dateByAddingUnit(
        .Day,
        value: day,
        toDate: date,
        options: []
    )
    if let sDate = searchedDate {
      let cal: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
      let components = cal.components([.Year, .Month, .Day, .Hour, .Minute, .Second], fromDate: sDate)
      
      // Check if date at 15:00:00 exists
      components.hour = 15
      components.minute = 00
      components.second = 0
      
      let newDate = cal.dateFromComponents(components)!
      let filteredList = weatherList.filter { $0.date == newDate }
      if filteredList.count != 0 {
        return filteredList.first
      } else {
        components.hour = 01
        components.minute = 00
        components.second = 0
        let newDate = cal.dateFromComponents(components)!
        let filteredList = weatherList.filter { $0.date! >= newDate }
        if filteredList.count != 0 {
          return filteredList.first
        }
        
      }
    }
    
    return nil
  }
}
