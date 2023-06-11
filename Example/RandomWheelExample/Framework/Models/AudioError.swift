//
//  AudioError.swift
//
//  Created by Vitalii Sosin on 11.06.2023.
//

import Foundation

/// Audio related error
enum AudioError: Error {
  case resourceNotFound(name: String)
  case invalidSoundIdentifier(name: String)
  case audioLoadingFailure
}

extension AudioError: CustomStringConvertible {
  /// Error's description
  var description: String {
    switch self {
    case .resourceNotFound(let name):
      return "Resource not found '\(name)'"
    case .invalidSoundIdentifier(let name):
      return "Invalid identifier. No sound loaded named '\(name)'"
    case .audioLoadingFailure:
      return "Could not load audio data"
    }
  }
}
