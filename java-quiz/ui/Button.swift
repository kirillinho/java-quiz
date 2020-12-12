import UIKit

final class Button {
     
     private let button = UIButton()
     
     init(text: String) {
          button.setTitle(text, for: .normal)
          button.setTitleColor(.black, for: .normal)
     }
     
     init(_ text: String, _ target: Any?, _ action: Selector) {
          button.setTitle(text, for: .normal)
          button.setTitleColor(.black, for: .normal)
          let _ = addTarget(target, action)
     }
     
     func addTarget(_ target: Any?, _ action: Selector) -> Self {
          button.addTarget(target, action: action, for: .touchUpInside)
          return self
     }
     
     func tag(_ tag: Int) -> Self {
          button.tag = tag
          return self
     }
     
     func build() -> UIButton { button }
}
