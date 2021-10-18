//
//  SearchVC.swift
//  GHFollowers
//
//  Created by FOLAHANMI KOLAWOLE on 17/10/2021.
//

import UIKit

class SearchVC: UIViewController {
  
  // MARK: - PROPERTIES
  let logoImageView = UIImageView()
  let usernameTextField = GFTextField()
  let callToActionButton = GFButton(backgroundColor: .systemGreen, title: StringConstants.SearchVC.GFButton.title)
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
}
