//
//  Tweet.swift
//  OpenTweet
//
//  Created by Madeline Eckhart on 4/27/21.
//  Copyright © 2021 OpenTable, Inc. All rights reserved.
//

import UIKit

typealias Timeline = [Tweet]

struct Tweet: Codable {
    var id: String
    var inReplyTo: String
    var author: String
    var avatar: String
    var content: String
    var date: Date
}
