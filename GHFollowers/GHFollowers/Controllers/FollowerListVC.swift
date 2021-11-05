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
  var collectionView: UICollectionView!
  
  // MARK: - VIEW LIFECYCLE METHODS
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViewController()
    configureCollectionView()
    getFollowers()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  // MARK: - CUSTOM FUNCTIONS
  func configureCollectionView() {
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
    view.addSubview(collectionView)
    collectionView.backgroundColor = .systemPink
    collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseIdentifier)
  }
  
  func configureViewController() {
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  func getFollowers() {
    NetworkManager.shared.getFollowers(for: username, page: 1, perPageFollowers: 100) { result in
      switch result {
      case .failure(let error):
        self.presentGFAlertOnMainThread(title: "ERROR!!!", message: error.rawValue, buttonTitle: "OK")
      case .success(let followers):
        dump("Followers.count: \(followers.count)")
      }
    }
  }
}
