//
//  Post.swift
//  DcardImitation
//
//  Created by Machir on 2021/8/31.
//

import Foundation

struct Post: Codable {
    let id: Int
    let title: String
    let excerpt: String
    let commentCount: Int
    let likeCount: Int
    let forumName: String
    let gender: String
    let school: String?
    let mediaMeta: [MediaMeta]
}

struct MediaMeta: Codable {
    let url: URL
}
