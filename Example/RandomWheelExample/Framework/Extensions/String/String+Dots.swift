//
//  String+Dots.swift
//
//  Created by Vitalii Sosin on 11.06.2023.
//

import Foundation

extension String {
  /// Replaces characters with dots at the end
  /// - Parameter count: last character count
  mutating func replaceLastCharactersWithDots(count: Int = 3) {
    var string = self
    let dots = Array.init(repeating: ".", count: count).joined()
    let start = string.index(string.endIndex, offsetBy: -count)
    let end = string.endIndex
    string.replaceSubrange(start..<end, with: dots)
    self = string
  }
}
