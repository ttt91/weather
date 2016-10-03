//
//  ViewController.swift
//  weather
//
//  Created by Mabo on 02/10/2016.
//  Copyright © 2016 Thanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var ibCollectionView: UICollectionView!
  var weatherItems = [WeatherItem]()
  let dataFetcher = DataFetcher()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = "Paris"
    
    ForecastCell.registerCell(collectionView: ibCollectionView)
    
    self.automaticallyAdjustsScrollViewInsets = false
    self.ibCollectionView.dataSource = self
    self.ibCollectionView.delegate = self
    self.populateCollectionView()
  }
  
  func populateCollectionView() {
    self.loadWeather()
  }
  
  func loadFromDatabase() {
    if let forecast = Forecast.last(), city = forecast.city, cityname = city.name {
      self.title = cityname
      self.weatherItems = dataFetcher.data(forecast, days: 5)
      self.ibCollectionView.reloadData()
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func showError(error:NSError) {
    let message = error.userInfo[NSLocalizedDescriptionKey] as? String
    let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .Alert)
    alertController.addAction(UIAlertAction(title: "Ok", style: .Cancel, handler: nil))
    self.presentViewController(alertController, animated: true, completion: nil)
  }


}

// MARK: Network part
extension ViewController {
  func loadWeather(city:String = "Paris,fr", days:Int = 5) {
    WeatherServices.sharedInstance.weathers(forCity: city, andDays: days) { (city, result, error) -> Void in
      if let error = error {
        self.showError(error)
        self.loadFromDatabase()
      } else if let result = result {
        self.weatherItems = self.dataFetcher.data(result, days: days)
        self.ibCollectionView.reloadData()
      }
    }
  }
}

//MARK : - UICollectionViewDataSource
extension ViewController : UICollectionViewDataSource {
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.weatherItems.count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let ret = collectionView.dequeueReusableCellWithReuseIdentifier(ForecastCell.identifier, forIndexPath: indexPath) as! ForecastCell
    ret.loadCell(self.weatherItems[indexPath.row], color: Helper.forecastColor(index: indexPath.row))
    return ret
  }
}

//MARK : - UICollectionViewDelegate
extension ViewController : UICollectionViewDelegate {
  
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    let controller = StoryboardScene.Main.instantiateDetailViewController()
    controller.weatherItem = self.weatherItems[indexPath.row]
    controller.color = Helper.forecastColor(index: indexPath.row)
    
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
}

//MARK : - UICollectionViewDelegateFlowLayout
extension ViewController : UICollectionViewDelegateFlowLayout {
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    let size = UIScreen.mainScreen().bounds.size.width - 20
    let ret = CGSize(width: size, height: size)
    return ret
  }
  
}

