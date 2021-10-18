//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by FOLAHANMI KOLAWOLE on 18/10/2021.
//

import UIKit

class FollowerListVC: UIViewController {
  
  // MARK: - PROPERTIES
  var username: String!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    navigationController?.isNavigationBarHidden = false
    navigationController?.navigationBar.prefersLargeTitles = true
  }
}
