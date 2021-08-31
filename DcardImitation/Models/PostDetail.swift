//
//  PostDetail.swift
//  DcardImitation
//
//  Created by Machir on 2021/8/30.
//

import Foundation

struct PostDetail: Codable {
    let content: String
    let createdAt: Date
    let commentCount: Int
    let likeCount: Int
    let mediaMeta: [Media]
}

struct Media: Codable {
    let url: URL
    let width: Int
    let height: Int
}
