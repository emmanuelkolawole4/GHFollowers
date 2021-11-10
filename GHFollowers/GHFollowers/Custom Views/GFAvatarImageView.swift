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
  
  func downloadImage(from urlString: String) {
    guard let url = URL(string: urlString) else { return }
    
    let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
      guard let self = self else { return }
      if let _ = error { return }
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
      guard let data = data else { return }
      
      guard let image = UIImage(data: data) else {
        dump("error creating image from data: \(error)")
        return
      }
      
      DispatchQueue.main.async {
        self.image = image
      }
    }
    task.resume()
  }
}
