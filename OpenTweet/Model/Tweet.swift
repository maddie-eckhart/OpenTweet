//
//  Tweet.swift
//  OpenTweet
//
//  Created by Madeline Eckhart on 4/27/21.
//  Copyright © 2021 OpenTable, Inc. All rights reserved.
//

import UIKit

struct Tweet: Codable {
    let id: String
    let author: String
    let content: String
    let avatar: String?
    let date: Date
    let inReplyTo: String?
}
