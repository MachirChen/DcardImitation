//
//  Comments.swift
//  DcardImitation
//
//  Created by Machir on 2021/8/31.
//

import Foundation

struct Comments: Codable {
    let id: String
    let createdAt: Date
    let content: String
    let floor: Int
    let gender: String
    let school: String?
}
