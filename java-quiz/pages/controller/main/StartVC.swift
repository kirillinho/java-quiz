import UIKit

final class StartVC: GeneralUIVC {
     
     override var style: Style { get { StartStyle() }}
     
     private let screenImg = UIImageView()
     private let start = Button(text: "Start Quiz").addTarget(self, #selector(go)).build()
     private let buttons = [
          Button("Results", self, #selector(results(sender:))).build(),
          Button("Settings", self, #selector(settings(sender:))).build(),
          Button("Help", self, #selector(help(sender:))).build()
     ]
     
     override func setupStyle() {
          buttons.forEach {
               style.apply(to: $0)
          }
     }
     
     override func setupLayout() {
          let stack = StackView(views: buttons)
               .axis(.horizontal)
               .distribution(.fillEqually)
               .alignment(.fill)
               .contentMode(.scaleToFill)
               .spacing(6)
               .build()
          
          view.addSubviews(views: [screenImg, start, stack])
          
          screenImg.anchor(
               top: view.topAnchor,
               leading: view.leadingAnchor,
               bottom: start.topAnchor,
               trailing: view.trailingAnchor,
               padding: UIEdgeInsets(top: 100, left: 65, bottom: 70, right: 71)
          )
          
          start.anchor(
               leading: view.leadingAnchor,
               bottom: stack.topAnchor,
               trailing: view.trailingAnchor,
               padding: UIEdgeInsets(top: 0, left: 16, bottom: 8, right: 16)
          )
          
          stack.anchor(
               leading: view.leadingAnchor,
               bottom: view.bottomAnchor,
               trailing: view.trailingAnchor,
               padding: UIEdgeInsets(top: 0, left: 16, bottom: 34, right: 16)
          )
     }
}

//MARK: - @OBJC SELECTORS
extension StartVC {
     @objc private func go(sender: UIButton!)       {     }
     @objc private func results(sender: UIButton!)  {   }
     @objc private func settings(sender: UIButton!) {  }
     @objc private func help(sender: UIButton!)     {}
}

extension StartVC {
     override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          navigationController?.setNavigationBarHidden(true, animated: animated)
     }

     override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          navigationController?.setNavigationBarHidden(false, animated: animated)
     }
}
