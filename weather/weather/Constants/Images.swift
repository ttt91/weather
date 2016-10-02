// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

#if os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  typealias Image = UIImage
#elseif os(OSX)
  import AppKit.NSImage
  typealias Image = NSImage
#endif

enum Asset: String {
  case Broken_clouds = "broken_clouds"
  case Clear_sky = "clear_sky"
  case Few_clouds = "few_clouds"
  case Mist = "mist"
  case Rain = "rain"
  case Scattered_clouds = "scattered_clouds"
  case Shower_rain = "shower_rain"
  case Snow = "snow"
  case Thunderstorm = "thunderstorm"

  var image: Image {
    return Image(asset: self)
  }
}

extension Image {
  convenience init!(asset: Asset) {
    self.init(named: asset.rawValue)
  }
}
