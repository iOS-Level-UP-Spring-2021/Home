//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {

  override func loadView() {
    view = UIView()
    view.backgroundColor = UIColor.white
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
    view.addGestureRecognizer(tap)
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
