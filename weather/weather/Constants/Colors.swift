// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

#if os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  typealias Color = UIColor
#elseif os(OSX)
  import AppKit.NSColor
  typealias Color = NSColor
#endif

extension Color {
  convenience init(rgbaValue: UInt32) {
    let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
    let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
    let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
    let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}

enum ColorName {
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#08a4a9"></span>
  /// Alpha: 100% <br/> (0x08a4a9ff)
  case Blue
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#a90097"></span>
  /// Alpha: 100% <br/> (0xa90097ff)
  case Purple
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ff5670"></span>
  /// Alpha: 100% <br/> (0xff5670ff)
  case Red
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffce00"></span>
  /// Alpha: 100% <br/> (0xffce00ff)
  case Yellow

  var rgbaValue: UInt32 {
    switch self {
    case .Blue: return 0x08a4a9ff
    case .Purple: return 0xa90097ff
    case .Red: return 0xff5670ff
    case .Yellow: return 0xffce00ff
    }
  }

  var color: Color {
    return Color(named: self)
  }
}

extension Color {
  convenience init(named name: ColorName) {
    self.init(rgbaValue: name.rgbaValue)
  }
}
