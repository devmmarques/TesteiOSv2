// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSColor
  internal typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  internal typealias Color = UIColor
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Colors

// swiftlint:disable identifier_name line_length type_body_length
internal struct ColorName {
  internal let rgbaValue: UInt32
  internal var color: Color { return Color(named: self) }

  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#3b49ee"></span>
  /// Alpha: 100% <br/> (0x3b49eeff)
  internal static let colorBackgroundHeader = ColorName(rgbaValue: 0x3b49eeff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fefefe"></span>
  /// Alpha: 100% <br/> (0xfefefeff)
  internal static let colorBackgroundTableView = ColorName(rgbaValue: 0xfefefeff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#dbdfe3"></span>
  /// Alpha: 100% <br/> (0xdbdfe3ff)
  internal static let colorBorderCell = ColorName(rgbaValue: 0xdbdfe3ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#a8b4c4"></span>
  /// Alpha: 100% <br/> (0xa8b4c4ff)
  internal static let colorGrayLight = ColorName(rgbaValue: 0xa8b4c4ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#485465"></span>
  /// Alpha: 100% <br/> (0x485465ff)
  internal static let colorGrayStrong = ColorName(rgbaValue: 0x485465ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#485465"></span>
  /// Alpha: 100% <br/> (0x485465ff)
  internal static let colorTitleStrong = ColorName(rgbaValue: 0x485465ff)
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

// swiftlint:disable operator_usage_whitespace
internal extension Color {
  convenience init(rgbaValue: UInt32) {
    let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
    let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
    let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
    let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}
// swiftlint:enable operator_usage_whitespace

internal extension Color {
  convenience init(named color: ColorName) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
