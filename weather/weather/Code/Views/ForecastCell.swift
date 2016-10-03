//
//  ForecastCell.swift
//  weather
//
//  Created by Mabo on 03/10/2016.
//  Copyright © 2016 Thanh. All rights reserved.
//

import UIKit

class ForecastCell: UICollectionViewCell {
  
  @IBOutlet weak var ibDateLabel: UILabel!
  @IBOutlet weak var ibImageView: UIImageView!
  @IBOutlet weak var ibTempLabel: UILabel!
  
  static let identifier = "ForecastCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.layer.cornerRadius = 10
  }
  
  static func registerCell(collectionView collection:UICollectionView) {
    let nib = UINib(nibName: ForecastCell.identifier, bundle: nil)
    collection.registerNib(nib, forCellWithReuseIdentifier: ForecastCell.identifier)
  }
  
  func loadCell(weatherItem:WeatherItem, color:UIColor) {
    self.backgroundColor = color
    let formatter = NSDateFormatter()
    formatter.dateStyle = .LongStyle
    
    if let name = weatherItem.description {
      self.ibImageView.image = Helper.image(name)
    }
    if let date = weatherItem.date {
      self.ibDateLabel.text = formatter.stringFromDate(date)
    }
    
    if let tempMorning = weatherItem.tempMorning, let tempAfternoon = weatherItem.tempAfternoon {
      self.ibTempLabel.text = "\(tempMorning.format(".0"))°C / \(tempAfternoon.format(".0"))°C"
    } else if let tempAfternoon = weatherItem.tempAfternoon {
      self.ibTempLabel.text = "\(tempAfternoon.format(".0"))°C"
    }
  }
}
