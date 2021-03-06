// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation
import UIKit

protocol StoryboardSceneType {
  static var storyboardName: String { get }
}

extension StoryboardSceneType {
  static func storyboard() -> UIStoryboard {
    return UIStoryboard(name: self.storyboardName, bundle: nil)
  }

  static func initialViewController() -> UIViewController {
    guard let vc = storyboard().instantiateInitialViewController() else {
      fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
    }
    return vc
  }
}

extension StoryboardSceneType where Self: RawRepresentable, Self.RawValue == String {
  func viewController() -> UIViewController {
    return Self.storyboard().instantiateViewControllerWithIdentifier(self.rawValue)
  }
  static func viewController(identifier: Self) -> UIViewController {
    return identifier.viewController()
  }
}

protocol StoryboardSegueType: RawRepresentable { }

extension UIViewController {
  func performSegue<S: StoryboardSegueType where S.RawValue == String>(segue: S, sender: AnyObject? = nil) {
    performSegueWithIdentifier(segue.rawValue, sender: sender)
  }
}

struct StoryboardScene {
  enum LaunchScreen: StoryboardSceneType {
    static let storyboardName = "LaunchScreen"
  }
  enum Main: String, StoryboardSceneType {
    static let storyboardName = "Main"

    case DetailViewControllerScene = "DetailViewController"
    static func instantiateDetailViewController() -> DetailViewController {
      guard let vc = StoryboardScene.Main.DetailViewControllerScene.viewController() as? DetailViewController
      else {
        fatalError("ViewController 'DetailViewController' is not of the expected class DetailViewController.")
      }
      return vc
    }

    case ViewControllerScene = "ViewController"
    static func instantiateViewController() -> ViewController {
      guard let vc = StoryboardScene.Main.ViewControllerScene.viewController() as? ViewController
      else {
        fatalError("ViewController 'ViewController' is not of the expected class ViewController.")
      }
      return vc
    }
  }
}

struct StoryboardSegue {
}
