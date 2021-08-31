//
//  Post.swift
//  DcardImitation
//
//  Created by Machir on 2021/8/24.
//

import Foundation

struct Post: Codable {
    let id: Int
    let title: String
    let excerpt: String
    let createdAt: Data
    let commentCount: Int
    let likeCount: Int
    let forumName: String
    let gender: String
    var school: String?
    var mediaMeta: [MediaMeta]
}

struct MediaMeta: Codable {
    var url: URL
}
