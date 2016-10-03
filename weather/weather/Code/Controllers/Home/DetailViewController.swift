//
//  DetailViewController.swift
//  weather
//
//  Created by Mabo on 04/10/2016.
//  Copyright © 2016 Thanh. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var ibTableView: UITableView!
  var color:UIColor = UIColor.whiteColor()
  var informations = [(String,String)]()
  
  var weatherItem: WeatherItem?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard let weatherItem = weatherItem else {
      return
    }
    
    self.automaticallyAdjustsScrollViewInsets = false
    self.ibTableView.dataSource = self
    self.ibTableView.backgroundColor = color
    self.ibTableView.estimatedRowHeight = 44
    self.ibTableView.tableFooterView = UIView(frame: CGRect.zero)
    
    self.ibTableView.rowHeight = UITableViewAutomaticDimension
    
    self.informations.append((tr(L10n.MorningWeather), "\(weatherItem.tempMorning?.format(".0") ?? "0")°C"))
    self.informations.append((tr(L10n.AfternoonWeather), "\(weatherItem.tempAfternoon?.format(".0") ?? "0")°C"))
    self.informations.append((tr(L10n.HumidityWeather), "\(weatherItem.humidity ?? 0)%"))
    self.informations.append((tr(L10n.WindSpeedWeather), "\(weatherItem.windSpeed?.format(".0") ?? "0") mps"))
    
  }
}

extension DetailViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var lRet:UITableViewCell?
    if indexPath.row == 0 {
      let lCell = ForecastDetailHeaderCell.dequeueCell(tableView: tableView)
      if let weatherItem = self.weatherItem {
        lCell.load(weatherItem, color: color)
      }
      lRet = lCell
    } else {
      let lCell = ForecastDetailCell.dequeueCell(tableView: tableView)
      let lTuple = self.informations[(indexPath.row - 1)]
      lCell.load(lTuple.0, value: lTuple.1, color: color)
      lRet = lCell
    }
    return lRet!
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return (self.informations.count + 1)
  }
}
