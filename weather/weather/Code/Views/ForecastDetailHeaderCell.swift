//
//  ForecastDetailHeaderCell.swift
//  weather
//
//  Created by Mabo on 04/10/2016.
//  Copyright © 2016 Thanh. All rights reserved.
//

import UIKit

class ForecastDetailHeaderCell: UITableViewCell {
  
  @IBOutlet weak var ibDateLabel: UILabel!
  @IBOutlet weak var ibImageView: UIImageView!
  @IBOutlet weak var ibTempLabel: UILabel!
  
  static let identifier = "ForecastDetailHeaderCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  static func dequeueCell(tableView pTableView:UITableView) -> ForecastDetailHeaderCell {
    var ret:ForecastDetailHeaderCell?
    ret = pTableView.dequeueReusableCellWithIdentifier(ForecastDetailHeaderCell.identifier) as? ForecastDetailHeaderCell
    if (ret == nil) {
      ret = NSBundle.mainBundle().loadNibNamed(ForecastDetailHeaderCell.identifier, owner: self, options: nil).first as? ForecastDetailHeaderCell
    }
    return ret!
  }
  
  func load(weatherItem: WeatherItem, color: UIColor) {
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
