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
  }
}

PlaygroundPage.current.liveView = MyViewController()
