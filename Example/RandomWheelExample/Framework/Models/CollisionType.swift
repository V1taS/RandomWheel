//
//  CollisionType.swift
//
//  Created by Vitalii Sosin on 11.06.2023.
//

import Foundation

/// Collision Type
enum CollisionType {
  case edge, center
  
  /// Identifier
  var identifier: String {
    switch self {
    case .edge:
      return "edgeCollision"
    case .center:
      return "centerCollision"
    }
  }
}
