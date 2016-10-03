// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation

enum L10n {
  /// Température matin
  case MorningWeather
  /// Température midi
  case AfternoonWeather
  /// Humidité
  case HumidityWeather
  /// Vitesse du vent
  case WindSpeedWeather
}

extension L10n: CustomStringConvertible {
  var description: String { return self.string }

  var string: String {
    switch self {
      case .MorningWeather:
        return L10n.tr("morning.weather")
      case .AfternoonWeather:
        return L10n.tr("afternoon.weather")
      case .HumidityWeather:
        return L10n.tr("humidity.weather")
      case .WindSpeedWeather:
        return L10n.tr("windSpeed.weather")
    }
  }

  private static func tr(key: String, _ args: CVarArgType...) -> String {
    let format = NSLocalizedString(key, comment: "")
    return String(format: format, locale: NSLocale.currentLocale(), arguments: args)
  }
}

func tr(key: L10n) -> String {
  return key.string
}
