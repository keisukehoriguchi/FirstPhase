//
//  Tweet.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/18.
//

import Foundation

struct Tweet: Codable {
    var user: User
    let tweetId: UUID
    var practice: Practice
    var startDate: Date
    var finishDate: Date
    var note: String
    var comment: [UUID]
    var prefer: [UUID]
}
