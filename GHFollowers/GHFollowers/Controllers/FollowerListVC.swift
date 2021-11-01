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
  
  // MARK: - VIEW LIFECYCLE METHODS
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = true
    NetworkManager.shared.getFollowers(for: username, page: 1, perPageFollowers: 100) { followers, errorMessage in
      guard let followers = followers, errorMessage == nil else {
        self.presentGFAlertOnMainThread(title: "ERROR!!!", message: errorMessage!, buttonTitle: "OK")
        return
      }
      
      dump("Followers.count: \(followers.count)")
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    //    navigationController?.isNavigationBarHidden = false
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
}
