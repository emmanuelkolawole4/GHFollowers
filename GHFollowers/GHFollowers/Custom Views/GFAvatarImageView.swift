//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by FOLAHANMI KOLAWOLE on 03/11/2021.
//

import UIKit

class GFAvatarImageView: UIImageView {
  
  // MARK: - INITIALIZERS
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - CUSTOM FUNCTIONS
  private func configure() {
    layer.cornerRadius = 10
    
    clipsToBounds = true
    image = Images.avatarImage
    
    translatesAutoresizingMaskIntoConstraints = false
  }
}
