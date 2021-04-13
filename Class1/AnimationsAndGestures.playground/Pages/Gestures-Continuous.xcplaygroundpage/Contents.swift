//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {

  override func loadView() {
    view = UIView()
    view.backgroundColor = .black
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
    view.addGestureRecognizer(pan)
  }

  private var panStartLocation: CGPoint?

  @objc func handlePan(_ pan: UIPanGestureRecognizer) {
    switch pan.state {
    case .began:
      panStartLocation = pan.location(in: view)
    case .changed:
      let newLocation = pan.location(in: view)
      guard let panStartLocation = panStartLocation else { return }
      let dx = newLocation.x - panStartLocation.x
      let dy = newLocation.y - panStartLocation.y
      let multiplier: CGFloat = 200
      let hueShift = min(1.0, abs(dx / multiplier))
      let brightnessShift = min(1.0, abs(dy / multiplier))
      let color = UIColor(hue: hueShift, saturation: 1.0, brightness: brightnessShift, alpha: 1.0)
      view.backgroundColor = color
    case .cancelled, .ended:
      panStartLocation = nil
      view.backgroundColor = .black
    default:
      return
    }
  }
}

PlaygroundPage.current.liveView = MyViewController()
