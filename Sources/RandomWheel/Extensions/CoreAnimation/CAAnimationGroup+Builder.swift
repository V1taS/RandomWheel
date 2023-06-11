//
//  CAAnimationGroup+Builder.swift
//
//  Created by Vitalii Sosin on 11.06.2023.
//

import Foundation

#if os(macOS)
import Cocoa
#else
import UIKit
#endif

extension CAAnimationGroup {
  
  convenience init(animations: [CAAnimation],
                   fillMode: String?,
                   forEffectLayer: Bool = false,
                   sublayersCount: NSInteger = 0) {
    self.init()
    self.animations = animations
    
    if let fillMode {
      if let animations = self.animations {
        for anim in animations {
          anim.fillMode = CAMediaTimingFillMode(rawValue: fillMode)
        }
      }
      self.fillMode = CAMediaTimingFillMode(rawValue: fillMode)
      self.isRemovedOnCompletion = false
    }

    if forEffectLayer {
      self.duration = self.maxDuration(sublayersCount: sublayersCount)
    } else {
      self.duration = animations.maxDuration
    }
  }
}
