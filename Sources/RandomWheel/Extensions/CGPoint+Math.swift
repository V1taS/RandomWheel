//
//  CGPoint+Math.swift
//
//  Created by Vitalii Sosin on 11.06.2023.
//

#if os(macOS)
import AppKit
#else
import UIKit
#endif

extension CGPoint {
  
  /// Calculates angle between point and circle center point
  /// - Parameters:
  ///   - comparisonPoint: Circle center point
  ///   - startPositionOffsetAngle: Circle rotation offset angle
  /// - Returns: Angle
  func angle(to comparisonPoint: CGPoint, startPositionOffsetAngle: CGFloat, rotationOffsetAngle: CGFloat) -> CGFloat {
    
#if os(macOS)
    // antiClockwise = -1
    let circleDrawDirection: CGFloat = -1
#else
    // Clockwise = 1
    let circleDrawDirection: CGFloat = 1
#endif
    
    let originX = comparisonPoint.x - x
    let originY = circleDrawDirection * (comparisonPoint.y - y)
    
    let bearingRadians = atan2f(Float(originY), Float(originX))
    
    let offsetDegreeForTopPosition: CGFloat = 90
    let _startPositionOffsetAngle = startPositionOffsetAngle * circleDrawDirection
    let _rotationOffsetAngle = rotationOffsetAngle * circleDrawDirection
    
    var bearingDegrees = CGFloat(bearingRadians).degrees - offsetDegreeForTopPosition - _startPositionOffsetAngle + _rotationOffsetAngle
    
    while bearingDegrees < 0 {
      bearingDegrees += 360
    }
    
    return bearingDegrees
  }
}
