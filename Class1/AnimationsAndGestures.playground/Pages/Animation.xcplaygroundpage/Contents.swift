import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {

  var squareView: UIView!

  override func loadView() {
    view = UIView()
    view.backgroundColor = .black
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    squareView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 140, height: 140)))
    squareView.backgroundColor = .systemOrange

    view.addSubview(squareView)
//    print(view.bounds) // - size not set up yet
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    print(view.bounds) // - size is set by the system
    //    we position our subviews in `viewWillAppear`! self.view has a size by then
    squareView.center = CGPoint(x: view.bounds.width * 0.5, y: view.bounds.height * 0.5)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [unowned self] in
//      //TODO: Change this animation
      self.animation3()
    }
  }

  private func animation1() {
    let animator = UIViewPropertyAnimator(duration: 4.0, curve: .easeInOut) {
      self.squareView.frame = self.squareView.frame.offsetBy(dx: 100, dy: 0)
    }
    animator.startAnimation()
  }

  private func animation2() {
    UIView.animate(withDuration: 2.4) {
      self.squareView.alpha = 0.0
      self.squareView.transform = CGAffineTransform(scaleX: 2, y: 2)
    }
  }

  private func animation3() {
    UIView.animate(withDuration: 0.6, delay: 0.0, options: [.curveEaseInOut], animations: {
      self.squareView.frame = self.squareView.frame.offsetBy(dx: 150, dy: 150)
    }, completion: { _ in
      print("Animation completed")
    })
  }
}

PlaygroundPage.current.liveView = MyViewController()
