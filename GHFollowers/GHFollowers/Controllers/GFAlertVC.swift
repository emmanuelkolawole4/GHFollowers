//
//  GFAlertVC.swift
//  GHFollowers
//
//  Created by FOLAHANMI KOLAWOLE on 18/10/2021.
//

import UIKit

class GFAlertVC: UIViewController {
  
  // MARK: - PROPERTIES
  let containerView = UIView()
  let titleLabel = GFTitleLabel(textAlignment: .center, fontSize: 20)
  let messageLabel = GFBodyLabel(textAlignment: .center)
  let callToActionButton = GFButton(backgroundColor: .systemPink, title: "OK")
  
  var alertTitle: String?
  var alertMessage: String?
  var alertButtonTitle: String?
  
  // MARK: - INITIALIZERS
  init(title: String?, message: String?, buttonTitle: String?) {
    super.init(nibName: nil, bundle: nil)
    self.alertTitle = title
    self.alertMessage = message
    self.alertButtonTitle = buttonTitle
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - VIEW LIFECYCLE METHODS
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
  }
}
