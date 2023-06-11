//
//  String+Width.swift
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
  /// Avalilable width for text with specified font
  /// - Parameter font: Font
  /// - Returns: Text width
  func width(by font: SFWFont) -> CGFloat {
    var textWidth: CGFloat = 0
    for element in self {
      let characterString = String(element)
      let letterSize = characterString.size(withAttributes: [.font: font])
      textWidth += letterSize.width
    }
    return textWidth + 1
  }
}
