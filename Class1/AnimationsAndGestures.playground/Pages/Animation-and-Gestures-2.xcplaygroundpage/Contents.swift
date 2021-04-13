//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {

  override func loadView() {
    view = UIView()
    view.backgroundColor = UIColor.white
  }

  private let startSize: CGSize = .init(width: 20, height: 20)
  private var spawnedView: UIView?

  override func viewDidLoad() {
    super.viewDidLoad()

    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
    view.addGestureRecognizer(panGesture)

    let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
    view.addGestureRecognizer(tap)
  }

  @objc func handlePan(_ pan: UIPanGestureRecognizer) {

    let location = pan.location(in: view)
    switch pan.state {
    case .began:
      guard spawnedView == nil else { return }
      let circle = spawnCircle(at: location)
      view.addSubview(circle)
      spawnedView = circle
    case .changed:
      spawnedView?.center = location
    case .ended, .cancelled:
      spawnedView?.removeFromSuperview()
      spawnedView = nil
    default:
      return
    }
  }

  private func spawnCircle(at point: CGPoint) -> UIView {
    let circle = UIView()
    circle.center = point
    circle.bounds.size = startSize
    circle.backgroundColor = .red
    circle.layer.cornerRadius = startSize.width * 0.5

    return circle
  }

  @objc func handleTap(_ tap: UITapGestureRecognizer) {
    let size: CGFloat = 50
    let spawnedView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: size, height: size)))
    spawnedView.center = tap.location(in: view)
    spawnedView.backgroundColor = .cyan
    spawnedView.layer.cornerRadius = size * 0.5
    view.addSubview(spawnedView)

    spawnedView.alpha = 0
    spawnedView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
    UIView.animate(withDuration: 0.2, animations: {
      spawnedView.alpha = 1
      spawnedView.transform = .identity
    }, completion: { completed in
      UIView.animate(withDuration: 0.2, animations: {
        spawnedView.alpha = 0
        spawnedView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
      }, completion: { completed in
        spawnedView.removeFromSuperview()
      })
    })
  }
}

PlaygroundPage.current.liveView = MyViewController()
