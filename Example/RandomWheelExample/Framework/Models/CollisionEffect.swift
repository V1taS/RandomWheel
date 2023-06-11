//
//  CollisionEffect.swift
//
//  Created by Vitalii Sosin on 11.06.2023.
//

#if os(macOS)
import AppKit
#else
import UIKit
#endif

/// Used to create a collision effect animation
public struct CollisionEffect {
  
  /// The force that will affect to collision effect, should be more than 0
  public var force: Double
  
  /// The angle which will be rotated a View
  public var angle: CGFloat
  
  /// Initializes collision effect
  /// - Parameters:
  ///   - force: The force that will affect to collision effect, should be more than 0, default value is 10
  ///   - angle: The angle which will be rotated a View, default value is 30
  public init(force: Double = 10, angle: CGFloat = 30) {
    self.force = force
    self.angle = angle
  }
}
