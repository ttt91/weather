//
//  ForecastDetailCell.swift
//  weather
//
//  Created by Mabo on 04/10/2016.
//  Copyright © 2016 Thanh. All rights reserved.
//

import UIKit

class ForecastDetailCell: UITableViewCell {
  
  @IBOutlet weak var ibDescriptionLabel: UILabel!
  @IBOutlet weak var ibValueLabel: UILabel!
  
  static let identifier = "ForecastDetailCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  static func dequeueCell(tableView tableView:UITableView) -> ForecastDetailCell {
    var ret:ForecastDetailCell?
    ret = tableView.dequeueReusableCellWithIdentifier(ForecastDetailCell.identifier) as? ForecastDetailCell
    if (ret == nil) {
      ret = NSBundle.mainBundle().loadNibNamed(ForecastDetailCell.identifier, owner: self, options: nil).first as? ForecastDetailCell
    }
    return ret!
  }
  
  func load(title:String, value:String, color:UIColor) {
    self.backgroundColor = color
    self.ibDescriptionLabel.text = title
    self.ibValueLabel.text = value
  }

  
}
