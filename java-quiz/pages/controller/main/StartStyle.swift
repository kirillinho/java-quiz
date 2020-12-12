import UIKit

struct StartStyle: Style {
     
     let attribute = TextAttribute(
          font: UIFont.systemFont(ofSize: 15),
          color: UIColor.white,
          bgColor: UIColor.black
     )
     
     func apply(to button: UIButton) {
          button.setTitleColor(.white, for: .normal)
          button.titleLabel?.font = attribute.font
          button.backgroundColor = attribute.bgColor
          button.layer.cornerRadius = 8
     }
}
