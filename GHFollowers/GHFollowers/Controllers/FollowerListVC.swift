//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by FOLAHANMI KOLAWOLE on 18/10/2021.
//

import UIKit

class FollowerListVC: UIViewController {
  
  // MARK: - PROPERTIES
  enum Section {
    case main
  }
  
  var username: String!
  var followers: [Follower] = []
  var filteredFollowers: [Follower] = []
  var page = 1
  var hasMoreFollowers = true
  var collectionView: UICollectionView!
  var searchController: UISearchController!
  var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
  
  // MARK: - VIEW LIFECYCLE METHODS
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViewController()
    configureSearchController()
    configureCollectionView()
    getFollowers()
    configureDataSource()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  // MARK: - CUSTOM FUNCTIONS
  func configureViewController() {
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.hidesSearchBarWhenScrolling = false
  }
  
  func configureCollectionView() {
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
    view.addSubview(collectionView)
    collectionView.delegate = self
    collectionView.backgroundColor = .systemBackground
    collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseIdentifier)
  }
  
  func configureSearchController() {
    searchController = UISearchController()
    searchController.searchResultsUpdater = self
    searchController.searchBar.delegate = self
    searchController.searchBar.placeholder = "Search for a username"
    searchController.obscuresBackgroundDuringPresentation = false
    navigationItem.searchController = searchController
  }
  
  func configureDataSource() {
    dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { collectionView, indexPath, follower in
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseIdentifier, for: indexPath) as? FollowerCell else { return UICollectionViewCell() }
      cell.set(follower: follower)
      return cell
    })
  }
  
  func updateData(on followers: [Follower]) {
    var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
    snapshot.appendSections([.main])
    snapshot.appendItems(followers)
    dataSource.apply(snapshot, animatingDifferences: true)
  }
  
  func getFollowers() {
    showLoadingView()
    NetworkManager.shared.getFollowers(for: username, page: page, perPageFollowers: 100) { [weak self] result in
      guard let self = self else { return }
      self.dismissLoadingView()
      switch result {
      case .failure(let error):
        self.presentGFAlertOnMainThread(title: "ERROR!!!", message: error.rawValue, buttonTitle: "OK")
      case .success(let followers):
        if followers.count < 100 { self.hasMoreFollowers = false }
        self.followers.append(contentsOf: followers)
        if self.followers.isEmpty {
          let message = "This User doesn't have any followers currently. Go follow them 😀."
          DispatchQueue.main.async { self.showEmptyStateView(with: message, in: self.view) }
          return
        }
        DispatchQueue.main.async {
          self.updateData(on: self.followers)
        }
        dump("Followers.count: \(followers.count)")
      }
    }
  }
}

extension FollowerListVC: UICollectionViewDelegate {
  
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    let offsetY = scrollView.contentOffset.y
    let contentHeight = scrollView.contentSize.height
    let height = scrollView.frame.size.height
    
    if offsetY > contentHeight - height {
      guard hasMoreFollowers else { return }
      page += 1
      getFollowers()
    }
  }
}


extension FollowerListVC: UISearchResultsUpdating, UISearchBarDelegate {
  
  func updateSearchResults(for searchController: UISearchController) {
    guard let filter = searchController.searchBar.text?.lowercased(), !filter.isEmpty else {
      filteredFollowers.removeAll()
      DispatchQueue.main.async {
        self.updateData(on: self.followers)
      }
      return
    }
    filteredFollowers = followers.filter({ follower in
      follower.login.lowercased().contains(filter)
    })
    DispatchQueue.main.async {
      self.updateData(on: self.filteredFollowers)
    }
  }
  
//  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//    DispatchQueue.main.async {
//      self.updateData(on: self.followers)
//    }
//  }
}
