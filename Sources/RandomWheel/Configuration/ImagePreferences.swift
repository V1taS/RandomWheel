//
//  ImagePreferences.swift
//
//  Created by Vitalii Sosin on 11.06.2023.
//

import Foundation

#if os(macOS)
import AppKit
#else
import UIKit
#endif

/// Image preferences
public struct ImagePreferences {
  
  /// Prefered image size, required
  public var preferredSize: CGSize
  
  /// Horizontal offset in slice from the center, default value is `0`
  public var horizontalOffset: CGFloat = 0
  
  /// Vertical offset in slice from the center
  public var verticalOffset: CGFloat
  
  /// Flip the text upside down, default value is `false`
  public var flipUpsideDown: Bool = false
  
  /// Background color, `optional`
  public var backgroundColor: SFWColor?
  
  /// Tint color, `optional`
  public var tintColor: SFWColor?
  
  /// Initiates a image preferences
  /// - Parameters:
  ///   - preferredSize: Prefered image size, required
  ///   - verticalOffset: Vertical offset in slice from the center, default value is `0`
  public init(preferredSize: CGSize,
              verticalOffset: CGFloat = 0) {
    self.preferredSize = preferredSize
    self.verticalOffset = verticalOffset
  }
}
