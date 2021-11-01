//
//  User.swift
//  GHFollowers
//
//  Created by FOLAHANMI KOLAWOLE on 25/10/2021.
//

import Foundation

struct User: Codable {
  var login: String
  var avatarUrl: String
  var name: String?
  var location: String?
  var bio: String?
  var publicRepos: Int
  var publicGists: Int
  var htmlUrl: String
  var following: Int
  var followers: Int
  var createdAt: String
  
  enum CodingKeys: String, CodingKey {
    case login, name, location, bio, following, followers
    case avatarUrl = "avatar_url", publicRepos = "public_repos", publicGists = "public_gists", htmlUrl = "html_url", createdAt = "created_at"
  }
}
