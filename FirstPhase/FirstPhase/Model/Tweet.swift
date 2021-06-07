//
//  Tweet.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/18.
//

import Foundation

struct Tweet: Codable, Equatable, Identifiable {
    static func == (lhs: Tweet, rhs: Tweet) -> Bool {
        lhs.id == rhs.id
    }
    
    var user: User
    let id: UUID
    var practice: Practice
    var startDate: Date
    var finishDate: Date
    var duringTime: String
    var note: String
    var comment: [UUID]
    var prefer: [UUID]
    
    init(
        user: User,
        tweetId: UUID,
        practice: Practice,
        startDate: Date,
        finishDate: Date,
        note: String,
        comment: [UUID],
        prefer: [UUID]
    ) {
        self.user = user
        self.id = tweetId
        self.practice = practice
        self.startDate = startDate
        self.finishDate = finishDate
        self.duringTime = Date().autoCalculate(start: startDate, finish: finishDate)
        self.note = note
        self.comment = comment
        self.prefer = prefer
    }
    
//    init(data: [String: Any]) {
//        self.name = data["name"] as? String ?? ""
//        self.id = data["id"] as? String ?? ""
//        self.imgUrl = data["imgUrl"] as? String ?? ""
//        self.isActive = data["isActive"] as? Bool ?? true
//        self.timeStamp = data["timeStamp"] as? Timestamp ?? Timestamp()
//    }
    
}
