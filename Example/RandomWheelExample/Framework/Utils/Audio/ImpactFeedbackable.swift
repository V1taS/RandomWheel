//
//  ImpactFeedbackable.swift
//  RandomWheelExample
//
//  Created by Vitalii Sosin on 11.06.2023.
//

import Foundation

#if os(macOS)
import AppKit
#else
import UIKit
#endif

#if os(iOS)
/// The protocol that adds support for the impact feedback
protocol ImpactFeedbackable {
  @available(iOS 10.0, iOSApplicationExtension 10.0, *)
  /// Use impact feedback to indicate that an impact has occurred
  var impactFeedbackgenerator: UIImpactFeedbackGenerator { get }
  /// Impact feedback on or off
  var impactFeedbackOn: Bool { get set }
}

extension ImpactFeedbackable {
  /// Prepare impact feedback if needed
  func prepareImpactFeedbackIfNeeded() {
    if #available(iOS 10.0, iOSApplicationExtension 10.0, *) {
      guard impactFeedbackOn == true else { return }
      impactFeedbackgenerator.prepare()
    } else {
      // Fallback on earlier versions
    }
  }
  
  /// Generates impact feedback
  func impactFeedback() {
    if #available(iOS 10.0, iOSApplicationExtension 10.0, *) {
      if impactFeedbackOn {
        impactFeedbackgenerator.impactOccurred()
      }
    } else {
      // Fallback on earlier versions
    }
  }
}
#endif
