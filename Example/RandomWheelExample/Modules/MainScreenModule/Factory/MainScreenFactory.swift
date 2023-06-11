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
    let colors = [#colorLiteral(red: 0.9420027733, green: 0.7658308744, blue: 0.136086911, alpha: 1), #colorLiteral(red: 0.9099512696, green: 0.4911828637, blue: 0.1421333849, alpha: 1), #colorLiteral(red: 0.8836082816, green: 0.3054297864, blue: 0.2412178218, alpha: 1), #colorLiteral(red: 0.8722914457, green: 0.1358049214, blue: 0.382327497, alpha: 1), #colorLiteral(red: 0.578535378, green: 0.6434150338, blue: 0.6437515616, alpha: 1),  #colorLiteral(red: 0.07094667107, green: 0.6180127263, blue: 0.5455638766, alpha: 1), #colorLiteral(red: 0.1627037525, green: 0.4977462888, blue: 0.7221878171, alpha: 1),  #colorLiteral(red: 0.5330474377, green: 0.2909428477, blue: 0.6148440838, alpha: 1), #colorLiteral(red: 0.5619059801, green: 0.2522692084, blue: 0.4293728471, alpha: 1), #colorLiteral(red: 0.2041620612, green: 0.3005031645, blue: 0.3878828585, alpha: 1)]
    let pin = SFWConfiguration.PinImageViewPreferences(size: CGSize(width: 30,height: 50),
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
