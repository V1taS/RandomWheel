//
//  Calc.swift
//
//  Created by Vitalii Sosin on 11.06.2023.
//

import Foundation
import CoreGraphics

struct Calc {
  
  /// Flip rotation
  static var flipRotation: CGFloat {
    return .pi
  }
  
  /// to rad.
  /// - Parameter f: degree
  /// - Returns: postion
  static func torad(_ f: CGFloat) -> CGFloat {
    return f * .pi / 180.0
  }
  
  /// Circular segment height for radius and degree
  /// - Parameters:
  ///   - radius: degree
  ///   - degree: radius
  /// - Returns: height
  static func circularSegmentHeight(radius: CGFloat, from degree: CGFloat) -> CGFloat {
    return 2 * radius * sin(degree / 2.0 * CGFloat.pi / 180)
  }
  
  /// Radius calculation
  /// - Parameters:
  ///   - circularSegmentHeight: Circular segment height
  ///   - degree: degree
  /// - Returns: radius
  static func radius(circularSegmentHeight: CGFloat, from degree: CGFloat) -> CGFloat {
    return circularSegmentHeight / (2 * sin(degree / 2.0 * CGFloat.pi / 180))
  }
}
