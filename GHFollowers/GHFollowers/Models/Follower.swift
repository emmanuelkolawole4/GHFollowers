//
//  Follower.swift
//  GHFollowers
//
//  Created by FOLAHANMI KOLAWOLE on 25/10/2021.
//

import Foundation

struct Follower: Codable {
  var login: String
  var avatarUrl: String
  
  enum CodingKeys: String, CodingKey {
    case login, avatarUrl = "avatar_url"
  }
}
