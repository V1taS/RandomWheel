//
//  Color+Random.swift
//
//  Created by Vitalii Sosin on 11.06.2023.
//

import Foundation

#if os(macOS)
import AppKit
#else
import UIKit
#endif

extension SFWColor {
  /// Random color
  static var random: SFWColor {
    return SFWColor(red: .random(in: 0...1),
                    green: .random(in: 0...1),
                    blue: .random(in: 0...1),
                    alpha: 1.0)
  }
}
