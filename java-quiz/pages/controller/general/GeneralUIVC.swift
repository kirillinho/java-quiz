import UIKit

class GeneralUIVC: UIViewController {
     
     private let activityIndicator = UIActivityIndicatorView()
     
     var style: Style { get { StartStyle() } }
     
     override func viewDidLoad() {
          basicSetup()
          setupStyle()
          DispatchQueue.global(qos: .background).async {
               self.fillAttributes()
               DispatchQueue.main.async {
                    self.activeIndicatorIs(isOn: true)
                    self.setupLayout()
               }
          }
     }
     
     private func basicSetup() {
          view.addSubview(activityIndicator)
          activityIndicator.anchor(
               centerX: view.centerXAnchor,
               centerY: view.centerYAnchor,
               size: CGSize(width: 50, height: 50)
          )
          activeIndicatorIs(isOn: false)
          view.backgroundColor = .white
     }
     
     private func activeIndicatorIs(isOn: Bool) {
          isOn ? activityIndicator.stopAnimating() : activityIndicator.startAnimating()
          activityIndicator.isHidden = isOn
     }
     
     func setupStyle() {}
     func fillAttributes() {}
     func setupLayout() {}
}
