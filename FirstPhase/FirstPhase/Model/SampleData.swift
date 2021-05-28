//
//  SampleData.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/14.
//
import Foundation

let user1 = User(id: UUID(), name: "chiguri", icon: "", profile: "よろしく")
let user2 = User(id: UUID(), name: "oreore", icon: "", profile: "俺？俺、俺俺俺！")
let user2_1 = User(id: user2.id, name: "orejanai", icon: "", profile: "Ah-真夏のーらららら！")
let user3 = User(id: UUID(), name: "charhan", icon: "", profile: "Hello!")

let practice1 = Practice(
    practiceId: UUID(),
    name: "毎日30分曲作り進める",
    practiceCategory: .musicCreation,
    isPractice: true,
    needsReminder: false
//    reminder: nil
)

let practice2 = Practice(
    practiceId: UUID(),
    name: "絵の制作動画見る",
    practiceCategory: .illustrationCreation,
    isPractice: false,
    needsReminder: false
//    reminder: nil
)

let practice2_1 = Practice(
    practiceId: practice2.practiceId,
    name: "絵の制作をする",
    practiceCategory: .appProgramCreation,
    isPractice: true,
    needsReminder: true
)

let practice3 = Practice(
    practiceId: UUID(),
    name: "アクセサリー作り",
    practiceCategory: .accyClothDIY,
    isPractice: true,
    needsReminder: false
)


let tweet1 = Tweet(
    user: user1,
    tweetId: UUID(),
    practice: practice1,
    startDate: Date(),
    finishDate: Date(),
    note: "がんばった",
    comment: [],
    prefer: []
)

let tweet2 = Tweet(
    user: user2,
    tweetId: UUID(),
    practice: practice2,
    startDate: Date(),
    finishDate: Date(),
    note: "いつもより頑張った",
    comment: [],
    prefer: []
)

let tweet2_1 = Tweet(
    user: user2,
    tweetId: tweet2.tweetId,
    practice: practice3,
    startDate: Date(),
    finishDate: Date(),
    note: "いつもよりは頑張ってなかった",
    comment: [],
    prefer: []
)

let tweet3 = Tweet(
    user: user1,
    tweetId: UUID(),
    practice: practice3,
    startDate: Date(),
    finishDate: Date(),
    note: "ウルトラソウル",
    comment: [],
    prefer: []
)

let comment1 = Comment(commentId: UUID(), message: "えらい")
let comment2 = Comment(commentId: UUID(), message: "えらいっつ！")
let comment2_1 = Comment(commentId: comment2.commentId, message: "Awesome!")
let comment3 = Comment(commentId: UUID(), message: "えらいのか？")
