//
//  NSView+AnchorPoint.swift
//
//  Created by Vitalii Sosin on 11.06.2023.
//

import Foundation

#if os(macOS)
import AppKit

extension NSView {
  func setAnchorPoint(anchorPoint: CGPoint) {
    if let layer = self.layer {
      var newPoint = CGPoint(x: self.bounds.size.width * anchorPoint.x, y: self.bounds.size.height * anchorPoint.y)
      var oldPoint = CGPoint(x: self.bounds.size.width * layer.anchorPoint.x, y: self.bounds.size.height * layer.anchorPoint.y)
      
      newPoint = newPoint.applying(layer.affineTransform())
      oldPoint = oldPoint.applying(layer.affineTransform())
      
      var position = layer.position
      
      position.x -= oldPoint.x
      position.x += newPoint.x
      
      position.y -= oldPoint.y
      position.y += newPoint.y
      
      layer.position = position
      layer.anchorPoint = anchorPoint
    }
  }
}
#else
import UIKit

extension UIView {
  func setAnchorPoint(anchorPoint: CGPoint) {
    let layer = self.layer
    var newPoint = CGPoint(x: self.bounds.size.width * anchorPoint.x, y: self.bounds.size.height * anchorPoint.y)
    var oldPoint = CGPoint(x: self.bounds.size.width * layer.anchorPoint.x, y: self.bounds.size.height * layer.anchorPoint.y)
    
    newPoint = newPoint.applying(layer.affineTransform())
    oldPoint = oldPoint.applying(layer.affineTransform())
    
    var position = layer.position
    
    position.x -= oldPoint.x
    position.x += newPoint.x
    
    position.y -= oldPoint.y
    position.y += newPoint.y
    
    layer.position = position
    layer.anchorPoint = anchorPoint
  }
}
#endif
