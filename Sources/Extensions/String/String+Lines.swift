//
//  String+Lines.swift
//
//  Created by Vitalii Sosin on 11.06.2023.
//

import Foundation

#if os(macOS)
import AppKit
#else
import UIKit
#endif

extension String {
  /// Сounts the right amount of lines for text
  /// - Parameters:
  ///   - font: Font
  ///   - spacing: Spacing between lines
  /// - Returns: Right amount of lines for text
  func linesCount(for font: SFWFont, spacing: CGFloat) -> Int {
    let width = self.width(by: font)
    return max(1, Int((width / (font.pointSize + spacing)).rounded(.down)))
  }
}
