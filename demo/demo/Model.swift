//
//  Model.swift
//  demo
//
//  Created by KPC on 2018/5/16.
//  Copyright © 2018年 KPC. All rights reserved.
//

import SwiftyJSON

public protocol Parseable {
    init(json: JSON)
}

struct GitHubModel: Parseable {
    var public_repos: Int = 0
    var organizations_url: String?
    var repos_url: String?
    var starred_url: String?
    var type: String?
    var bio: String?
    var gists_url: String?
    var followers_url: String?
    var id: Int = 0
    var blog: String?
    var followers: Int = 0
    var following: Int = 0
    var company: String?
    var url: String?
    var name: String?
    var updated_at: String?
    var public_gists: Int = 0
    var site_admin: Bool = false
    var gravatar_id: String?
    var html_url: String?
    var avatar_url: String?
    var login: String?
    var location: String?
    var created_at: String?
    var subscriptions_url: String?
    var following_url: String?
    var received_events_url: String?
    var events_url: String?
    
    init(json: JSON) {
        public_repos = json["public_repos"].intValue
        organizations_url = json["organizations_url"].stringValue
        repos_url = json["repos_url"].stringValue
        starred_url = json["starred_url"].stringValue
        type = json["type"].stringValue
        bio = json["bio"].stringValue
        gists_url = json["gists_url"].stringValue
        followers_url = json["followers_url"].stringValue
        id = json["id"].intValue
        blog = json["blog"].stringValue
        followers = json["followers"].intValue
        following = json["following"].intValue
        company = json["company"].stringValue
        url = json["url"].stringValue
        name = json["name"].stringValue
        updated_at = json["updated_at"].stringValue
        public_gists = json["public_gists"].intValue
        site_admin = json["site_admin"].boolValue
        gravatar_id = json["gravatar_id"].stringValue
        html_url = json["html_url"].stringValue
        avatar_url = json["avatar_url"].stringValue
        login = json["login"].stringValue
        location = json["location"].stringValue
        created_at = json["created_at"].stringValue
        subscriptions_url = json["subscriptions_url"].stringValue
        following_url = json["following_url"].stringValue
        received_events_url = json["received_events_url"].stringValue
        events_url = json["events_url"].stringValue
    }
}
