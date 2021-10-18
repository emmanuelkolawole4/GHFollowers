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
  
  // MARK: - VIEW LIFECYCLE METHODS
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    layoutSubviews()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.isNavigationBarHidden = true
  }
  
  // MARK: - CUSTOM FUNCTIONS
  func configureLogoImageView() {
    view.addSubview(logoImageView)
    logoImageView.translatesAutoresizingMaskIntoConstraints = false
    logoImageView.image = UIImage(named: StringConstants.SearchVC.LogoImageView.imageName)
    
    NSLayoutConstraint.activate([
      logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
      logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      logoImageView.heightAnchor.constraint(equalToConstant: 200),
      logoImageView.widthAnchor.constraint(equalToConstant: 200)
    ])
  }
  
  func configureUsernameTextField() {
    view.addSubview(usernameTextField)
    NSLayoutConstraint.activate([
      usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
      usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      usernameTextField.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  
  func configureCallToActionButton() {
    view.addSubview(callToActionButton)
    NSLayoutConstraint.activate([
      callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      callToActionButton.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  
  func layoutSubviews() {
    configureLogoImageView()
    configureUsernameTextField()
    configureCallToActionButton()
  }
}
