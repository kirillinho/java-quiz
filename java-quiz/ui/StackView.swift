import UIKit

final class StackView {
     
     private let stack: UIStackView
     
     init(views: [UIView]) {
          self.stack = UIStackView(arrangedSubviews: views)
     }
     
     func axis(_ axis: NSLayoutConstraint.Axis) -> Self {
          stack.axis = axis
          return self
     }
     
     func distribution(_ distribution: UIStackView.Distribution) -> Self {
          stack.distribution = distribution
          return self
     }
     
     func alignment(_ alignment: UIStackView.Alignment) -> Self {
          stack.alignment = alignment
          return self
     }
     
     func contentMode(_ contentMode: UIView.ContentMode) -> Self {
          stack.contentMode = contentMode
          return self
     }
     
     func spacing(_ spacing: CGFloat) -> Self {
          stack.spacing = spacing
          return self
     }
     
     func build() -> UIStackView { stack }
}
