//
//  CGFloat+Math.swift
//
//  Created by Vitalii Sosin on 11.06.2023.
//

#if os(macOS)
import AppKit
#else
import UIKit
#endif

extension CGFloat {
  
  /// rad. to degrees
  var degrees: CGFloat {
    return self * 180 / .pi
  }
  
  /// to rad.
  /// - Parameter f: degree
  /// - Returns: postion
  var torad: CGFloat {
    return self * .pi / 180.0
  }
  
  /// Flip rotation
  static var flipRotation: CGFloat {
    return .pi
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
