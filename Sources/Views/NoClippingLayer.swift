//
//  NoClippingLayer.swift
//
//  Created by Vitalii Sosin on 11.06.2023.
//

import Foundation

#if os(macOS)
import AppKit
#else
import UIKit
#endif

final class NoClippingLayer: CALayer {
  override var masksToBounds: Bool {
    set {
      //
    }
    get {
      return false
    }
  }
}
