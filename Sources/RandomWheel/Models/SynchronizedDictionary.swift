//
//  SynchronizedDictionary.swift
//
//  Created by Vitalii Sosin on 11.06.2023.
//

import Foundation

final class SynchronizedDictionary<KeyType: Hashable, ValueType> {
  private var dictionary: [KeyType: ValueType] = [:]
  private let queue = DispatchQueue(label: "com.downloader.SynchronizedDictionaryAccess", attributes: .concurrent)
  
  public func removeValue(forKey: KeyType) {
    queue.async(flags: .barrier) {
      self.dictionary.removeValue(forKey: forKey)
    }
  }
  
  public subscript(key: KeyType) -> ValueType? {
    set {
      queue.async(flags: .barrier) {
        self.dictionary[key] = newValue
      }
    } get {
      var element: ValueType?
      queue.sync {
        element = self.dictionary[key]
      }
      return element
    }
  }
  
  public func clear() {
    queue.async(flags: .barrier) {
      self.dictionary.removeAll()
    }
  }
}
