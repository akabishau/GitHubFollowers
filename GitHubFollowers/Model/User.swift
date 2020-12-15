//
//  User.swift
//  GitHubFollowers
//
//  Created by Aleksey on 1214..20.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var follower: Int
    var createdAt: String
}
