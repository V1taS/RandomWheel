//
//  MainScreenView.swift
//  RandomWheelExample
//
//  Created by Vitalii Sosin on 11.06.2023.
//

import UIKit
import RandomWheel

/// События которые отправляем из View в Presenter
protocol MainScreenViewOutput: AnyObject {}

/// События которые отправляем от Presenter ко View
protocol MainScreenViewInput {
  
  /// Обновить контент
  func updateContent(slices: [Slice], configuration: SFWConfiguration?)
}

/// Псевдоним протокола UIView & MainScreenViewInput
typealias MainScreenViewProtocol = UIView & MainScreenViewInput

/// View для экрана
final class MainScreenView: MainScreenViewProtocol {
  
  // MARK: - Internal properties
  
  weak var output: MainScreenViewOutput?
  
  // MARK: - Private properties
  
  private var fortuneWheel: SwiftFortuneWheel?
  
  // MARK: - Internal func
  
  func updateContent(slices: [Slice], configuration: SFWConfiguration?) {
    fortuneWheel = SwiftFortuneWheel(
      frame: Appearance().frame,
      slices: slices,
      configuration: configuration
    )
    
    configureLayout()
    applyDefaultBehavior(slices: slices)
  }
}

// MARK: - Private

private extension MainScreenView {
  func configureLayout() {
    guard let fortuneWheel else {
      return
    }
    
    subviews.forEach {
      $0.removeFromSuperview()
    }
    
    [fortuneWheel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      fortuneWheel.widthAnchor.constraint(equalToConstant: Appearance().frame.width),
      fortuneWheel.heightAnchor.constraint(equalToConstant: Appearance().frame.height),
      
      fortuneWheel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      fortuneWheel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
    ])
  }
  
  func applyDefaultBehavior(slices: [Slice]) {
    backgroundColor = .gray
    
    let finishIndex = Int.random(in: 0..<slices.count)
    
    fortuneWheel?.pinImage = "whitePinArrow"
    fortuneWheel?.pinImageViewCollisionEffect = CollisionEffect(force: 8, angle: 20)
    fortuneWheel?.edgeCollisionDetectionOn = true
    
    fortuneWheel?.onSpinButtonTap = { [weak self] in
      self?.fortuneWheel?.startRotationAnimation(finishIndex: finishIndex, continuousRotationTime: 1) { (finished) in
        print(finished)
      }
    }
  }
}

// MARK: - Appearance

private extension MainScreenView {
  struct Appearance {
    let frame = CGRect(x: .zero,
                       y: .zero,
                       width: UIScreen.main.bounds.width - 32,
                       height: UIScreen.main.bounds.width - 32)
  }
}
