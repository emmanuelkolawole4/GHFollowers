//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by FOLAHANMI KOLAWOLE on 25/10/2021.
//

import Foundation

class NetworkManager {
  
  static let shared = NetworkManager()
  
  private init() {}
  
  func getFollowers(for username: String, page: Int, perPageFollowers: Int, completion: @escaping ([Follower]?, ErrorMessage?) -> Void) {
    let endpoint = ApiEndpoint.baseURL + "\(username)/followers?per_page=\(perPageFollowers)&page=\(page)"
    guard let url = URL(string: endpoint) else {
      completion(nil, .invalidUsername)
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      if let _ = error {
        dump("error: \(error)")
        completion(nil, .unableToComplete)
        return
      }
      
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        dump("response: \(response)")
        completion(nil, .invalidResponse)
        return
      }
      
      guard let data = data else {
        dump("data: \(data)")
        completion(nil, .invalidData)
        return
      }
      
      do {
        let decoder = JSONDecoder()
        let followers = try decoder.decode([Follower].self, from: data)
        dump("followers: \(followers)")
        completion(followers, nil)
      } catch let decodingError {
        dump("error: \(decodingError)")
        completion(nil, .invalidData)
      }
    }
    task.resume()
  }
}
