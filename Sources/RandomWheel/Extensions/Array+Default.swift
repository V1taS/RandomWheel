//
//  Array+Default.swift
//
//  Created by Vitalii Sosin on 11.06.2023.
//

import Foundation

extension Array {
  public subscript(index: Int, default defaultValue: @autoclosure () -> Element) -> Element {
    guard index >= 0, index < endIndex else {
      return defaultValue()
    }
    
    return self[index]
  }
}
