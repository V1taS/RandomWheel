//
//  LinePreferences.swift
//
//  Created by Vitalii Sosin on 11.06.2023.
//

import Foundation

#if os(macOS)
import AppKit
#else
import UIKit
#endif

/// Line Preferences
public struct LinePreferences {
  
  /// Stroke height, default value is `1`
  public var height: CGFloat
  
  /// Stroke color type
  public var colorType: SFWConfiguration.ColorType
  
  /// Vertical offset in slice from the center
  public var verticalOffset: CGFloat
  
  /// Initiates a line preferences
  /// - Parameters:
  ///   - colorType: Line color type
  ///   - height: Stroke height, default value is `1`
  ///   - verticalOffset: Vertical offset in slice from the center, default value is `0`
  public init(colorType: SFWConfiguration.ColorType,
              height: CGFloat = 1,
              verticalOffset: CGFloat = 0) {
    self.colorType = colorType
    self.height = height
    self.verticalOffset = verticalOffset
  }
}

extension LinePreferences {
  func strokeColor(for index: Int) -> SFWColor {
    var strokeColor = SFWColor.clear
    
    switch self.colorType {
    case let .evenOddColors(evenColor, oddColor):
      strokeColor = index % 2 == 0 ? evenColor : oddColor
    case let .customPatternColors(colors, defaultColor):
      strokeColor = colors?[index, default: defaultColor] ?? defaultColor
    }
    return strokeColor
  }
}
