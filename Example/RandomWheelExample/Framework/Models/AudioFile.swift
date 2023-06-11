//
//  AudioFile.swift
//
//  Created by Vitalii Sosin on 11.06.2023.
//

import Foundation

/// Auido File used for play sound in SwiftFortuneWheel
public struct AudioFile {
  
  /// Filename
  var filename: String?
  
  /// Extension name
  var extensionName: String?
  
  /// File's bundle
  var bundle: Bundle?
  
  /// File's URL
  var url: URL?
  
  /// File's identifier
  var identifier: String?
  
  /// Initializes audio file
  /// - Parameters:
  ///   - filename: Filename
  ///   - extensionName: Extension name
  ///   - bundle: Bundle, optional
  public init(filename: String, extensionName: String, bundle: Bundle? = nil) {
    self.filename = filename
    self.extensionName = extensionName
    let bundle = bundle ?? Bundle.main
    self.bundle = bundle
    self.url = bundle.url(forResource: filename, withExtension: extensionName)
  }
  
  /// Initializes audio file
  /// - Parameter url: File's location URL
  public init(url: URL) {
    self.url = url
  }
}
