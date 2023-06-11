//
//  SynchronizedArray.swift
//
//  Created by Vitalii Sosin on 11.06.2023.
//

import Foundation

/// A thread-safe array.
final class SynchronizedArray<Element> {
  private let queue = DispatchQueue(label: "com.swiftfortunewheel.synchronizedarray", attributes: .concurrent)
  private var array = [Element]()
  
  public init() {}
}

extension SynchronizedArray {
  
  var synchronizedArray: [Element] {
    var array: [Element] = []
    queue.sync {
      array = self.array
    }
    return array
  }
  
  var count: Int {
    var count = 0
    queue.sync {
      count = self.array.count
    }
    return count
  }
  
  func append(_ element: Element) {
    queue.async(flags: .barrier) {
      self.array.append(element)
    }
  }
  
  func clear() {
    queue.async(flags: .barrier) {
      self.array.removeAll()
    }
  }
  
  subscript(index: Int) -> Element {
    var element: Element!
    queue.sync {
      element = self.array[index]
    }
    return element
  }
}

extension SynchronizedArray where Element: Comparable {
  
  func index(_ element: Element) -> Int? {
    var index: Int?
    queue.sync {
      index = self.array.firstIndex(where: {$0 == element})
    }
    return index
  }
  
  func contains(_ element: Element) -> Bool {
    var contains = false
    queue.sync {
      contains = self.array.contains(element)
    }
    return contains
  }
}
