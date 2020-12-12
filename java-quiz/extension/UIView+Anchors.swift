import UIKit


extension UIView {
     
     func fillSuperview(padding: UIEdgeInsets) {
          anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor,
                 bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor,
                 padding: padding)
     }
     
     func anchor(top: NSLayoutYAxisAnchor? = nil , leading: NSLayoutXAxisAnchor? = nil,
                 bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil,
                 centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil,
                 padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
          
          translatesAutoresizingMaskIntoConstraints = false
          
          if let top = top {
               topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
          }
          
          if let leading = leading {
               leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
          }
          
          if let bottom = bottom {
               bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
          }
          
          if let trailing = trailing {
               trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
          }
          
          if let centerX = centerX {
               centerXAnchor.constraint(equalTo: centerX).isActive = true
          }
          
          if let centerY = centerY {
               centerYAnchor.constraint(equalTo: centerY).isActive = true
          }
          
          if size.width != 0 {
               widthAnchor.constraint(equalToConstant: size.width).isActive = true
          }
          
          if size.height != 0 {
               heightAnchor.constraint(equalToConstant: size.height).isActive = true
          }
     }
     
     func anchorSize(to view: UIView) {
          widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
          heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
     }
     
     func addSubviews(views: [UIView]) { views.forEach{ addSubview($0) } }
     
     func lightBlur() {
          let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
          blurView.frame = bounds
          blurView.backgroundColor = .white
          blurView.layer.backgroundColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.29).cgColor
          blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
          blurView.alpha = 0.9
          blurView.tag = 99
          UIView.transition(with: self, duration: 1, options: [.transitionCrossDissolve], animations: {
               self.addSubview(blurView)
          }, completion: nil)
     }
     
     func lightBlurOff() {
          for v in subviews where v.tag == 99 {
               v.removeFromSuperview()
               return
          }
     }
     
     func pulsate() {
          let pulse = CASpringAnimation(keyPath: "transform.scale")
          pulse.duration = 0.3
          pulse.fromValue = 0.95
          pulse.toValue = 1.0
          pulse.autoreverses = true
          pulse.repeatCount = 1
          pulse.initialVelocity = 2
          pulse.damping = 1.0
          
          layer.add(pulse, forKey: "pulse")
     }
     
     func shake() {
          let shake = CABasicAnimation(keyPath: "position")
          shake.duration = 0.1
          shake.repeatCount = 1
          shake.autoreverses = true
          
          let fromValue = NSValue(cgPoint: CGPoint(x: center.x - 5, y: center.y))
          let toValue = NSValue(cgPoint: CGPoint(x: center.x + 5, y: center.y))
          
          shake.fromValue = fromValue
          shake.toValue = toValue
          
          layer.add(shake, forKey: "position")
     }
}
