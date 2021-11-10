//
//  FollowerCell.swift
//  GHFollowers
//
//  Created by FOLAHANMI KOLAWOLE on 03/11/2021.
//

import UIKit

class FollowerCell: UICollectionViewCell, ReuseIdentifying {
  
  // MARK: - PROPERTIES
  let avatarImageView = GFAvatarImageView(frame: .zero)
  let usernameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)
  let padding: CGFloat = 8
  
  // MARK: - INITIALIZERS
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - CUSTOM FUNCTIONS
  func set(follower: Follower) {
    usernameLabel.text = follower.login
    avatarImageView.downloadImage(from: follower.avatarUrl)
  }
  
  private func configure() {
    addSubview(avatarImageView)
    addSubview(usernameLabel)
    
    NSLayoutConstraint.activate([
      avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
      avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
      avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
      
      usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
      usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
      usernameLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
}
