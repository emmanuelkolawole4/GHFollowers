//
//  GFButton.swift
//  GHFollowers
//
//  Created by FOLAHANMI KOLAWOLE on 18/10/2021.
//

import UIKit

class GFButton: UIButton {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(with backgroundColor: UIColor, and title: String) {
    super.init(frame: .zero)
    
    self.backgroundColor = backgroundColor
    self.setTitle(title, for: .normal)
    configure()
  }
  
  private func configure() {
    layer.cornerRadius = 10
    
    titleLabel?.textColor = .white
    titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    
    translatesAutoresizingMaskIntoConstraints = false
  }
}
