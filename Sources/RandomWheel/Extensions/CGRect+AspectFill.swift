//
//  CGRect+AspectFill.swift
//
//  Created by Vitalii Sosin on 11.06.2023.
//

import Foundation

#if os(macOS)
import AppKit
#else
import UIKit
#endif

extension CGSize {
  
  static func aspectFill(aspectRatio: CGSize, minimumSize: CGSize) -> CGSize {
    
    var minimumSize = minimumSize
    let mW = minimumSize.width / aspectRatio.width
    let mH = minimumSize.height / aspectRatio.height
    
    if mH > mW {
      minimumSize.width = minimumSize.height / aspectRatio.height * aspectRatio.width
    } else if mW > mH {
      minimumSize.height = minimumSize.width / aspectRatio.width * aspectRatio.height
    }
    return minimumSize
  }
}
