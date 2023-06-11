//
//  MainScreenFactory.swift
//  RandomWheelExample
//
//  Created by Vitalii Sosin on 11.06.2023.
//

import UIKit
import RandomWheel

/// Cобытия которые отправляем из Factory в Presenter
protocol MainScreenFactoryOutput: AnyObject {}

/// Cобытия которые отправляем от Presenter к Factory
protocol MainScreenFactoryInput {
  
  /// Получить стиль текста
  func getVariousWheelSimpleText() -> TextPreferences
  
  /// Получить настройку колеса
  func getVariousWheelSimpleConfiguration() -> SFWConfiguration
  
  /// Получить контент
  func getSlices(texts: [String], preferences: TextPreferences) -> [Slice]
}

/// Фабрика
final class MainScreenFactory: MainScreenFactoryInput {
  
  // MARK: - Internal properties
  
  weak var output: MainScreenFactoryOutput?
  
  // MARK: - Internal func
  
  func getSlices(texts: [String], preferences: TextPreferences) -> [Slice] {
    return texts.compactMap {
      Slice(contents: [
        .text(text: $0, preferences: preferences)
      ])
    }
  }
  
  func getVariousWheelSimpleText() -> TextPreferences {
    return TextPreferences(
      textColorType: SFWConfiguration.ColorType.customPatternColors(colors: nil, defaultColor: .white),
      font: .systemFont(ofSize: 16, weight: .bold),
      verticalOffset: 12
    )
  }
  
  func getVariousWheelSimpleConfiguration() -> SFWConfiguration {
    let colors = [
      UIColor(hexString: "#F0C322"),
      UIColor(hexString: "#E87C24"),
      UIColor(hexString: "#E14D3E"),
      UIColor(hexString: "#DF2292"),
      UIColor(hexString: "#937BA4"),
      UIColor(hexString: "#129E8C"),
      UIColor(hexString: "#297FB9"),
      UIColor(hexString: "#884B9D"),
      UIColor(hexString: "#8F4070"),
      UIColor(hexString: "#344D63"),
    ]
    let pin = SFWConfiguration.PinImageViewPreferences(size: CGSize(width: 30, height: 50),
                                                       position: .top,
                                                       verticalOffset: -30)
    let sliceColorType = SFWConfiguration.ColorType.customPatternColors(colors: colors,
                                                                        defaultColor: .white)
    let slicePreferences = SFWConfiguration.SlicePreferences(backgroundColorType: sliceColorType,
                                                             strokeWidth: 3,
                                                             strokeColor: .white)
    let circlePreferences = SFWConfiguration.CirclePreferences(strokeWidth: 7,
                                                               strokeColor: .white)
    let wheelPreferences = SFWConfiguration.WheelPreferences(circlePreferences: circlePreferences,
                                                             slicePreferences: slicePreferences,
                                                             startPosition: .top)
    
    var spinButtonPreferences = SFWConfiguration.SpinButtonPreferences(size: CGSize(width: 80, height: 80))
    spinButtonPreferences.cornerRadius = 40
    spinButtonPreferences.textColor = .white
    spinButtonPreferences.font = .systemFont(ofSize: 20, weight: .bold)
    spinButtonPreferences.backgroundColor = .black
    let configuration = SFWConfiguration(wheelPreferences: wheelPreferences,
                                         pinPreferences: pin,
                                         spinButtonPreferences: spinButtonPreferences)
    return configuration
  }
}

// MARK: - Appearance

private extension MainScreenFactory {
  struct Appearance {}
}

// MARK: - UIColor

private extension UIColor {
  convenience init(hexString: String) {
    var r: CGFloat = .zero
    var g: CGFloat = .zero
    var b: CGFloat = .zero
    var a: CGFloat = 1
    
    let hexColor = hexString.replacingOccurrences(of: "#", with: "")
    let scanner = Scanner(string: hexColor)
    var hexNumber: UInt64 = 0
    var valid = false
    
    if scanner.scanHexInt64(&hexNumber) {
      if hexColor.count == 8 {
        r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
        g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
        b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
        a = CGFloat(hexNumber & 0x000000ff) / 255
        valid = true
      }
      
      else if hexColor.count == 6 {
        r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
        g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
        b = CGFloat(hexNumber & 0x0000ff) / 255
        valid = true
      }
    }
    
#if DEBUG
    assert(valid, "UIColor initialized with invalid hex string")
#endif
    
    self.init(red: r, green: g, blue: b, alpha: a)
  }
}
