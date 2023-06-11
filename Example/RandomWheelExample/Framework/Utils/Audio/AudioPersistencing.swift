//
//  AudioPersistencing.swift
//  RandomWheelExample
//
//  Created by Vitalii Sosin on 11.06.2023.
//

import Foundation
import AVFoundation

protocol AudioPersistencing {
  func enableHandleInterruption()
}

extension AudioPersistencing {
#if canImport(AVAudioSession)
  func enableHandleInterruption() {
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(handleInterruption),
                                           name: AVAudioSession.interruptionNotification,
                                           object: AVAudioSession.sharedInstance())
  }
  
  /// Stops audio when interrupted
  @objc func handleInterruption(notification: Notification) {
    guard let userInfo = notification.userInfo,
          let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
          let type = AVAudioSession.InterruptionType(rawValue: typeValue) else {
      return
    }
    
    isAudioInterrupted = type == .began
    
    if isAudioInterrupted {
      node.stop()
    }
  }
#else
  func enableHandleInterruption() {
    // do nothing
  }
#endif
}
