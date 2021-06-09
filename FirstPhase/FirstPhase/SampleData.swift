//
//  SampleData.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/14.
//
import Foundation

let user1 = User(id: UUID(uuidString: "9864D719-505C-4AC8-8462-7A2F89DF6688")!, name: "chiguri", icon: "", profile: "よろしく")
let user2 = User(id: UUID(), name: "oreore", icon: "", profile: "俺？俺、俺俺俺！")
let user2_1 = User(id: user2.id, name: "orejanai", icon: "", profile: "Ah-真夏のーらららら！")
let user3 = User(id: UUID(), name: "charhan", icon: "", profile: "Hello!")

let practice1 = Practice(
    id: UUID(),
    name: "毎日30分曲作り進める",
    practiceCategory: .musicCreation,
    isPractice: true,
    needsReminder: false
//    reminder: nil
)

let practice2 = Practice(
    id: UUID(),
    name: "絵の制作動画見る",
    practiceCategory: .illustrationCreation,
    isPractice: false,
    needsReminder: false
//    reminder: nil
)

let practice2_1 = Practice(
    id: practice2.id,
    name: "絵の制作をする",
    practiceCategory: .appProgramCreation,
    isPractice: true,
    needsReminder: true
)

let practice3 = Practice(
    id: UUID(),
    name: "アクセサリー作り",
    practiceCategory: .accyClothDIY,
    isPractice: true,
    needsReminder: false
)


let tweet1 = Tweet(
    user: user1,
    tweetId: UUID(),
    practice: practice1,
    startDate: Date(timeIntervalSince1970: 0),
    finishDate: Date(timeIntervalSince1970: 3680),
    note: "がんばった",
    comment: [],
    prefer: []
)

let tweet2 = Tweet(
    user: user2,
    tweetId: UUID(),
    practice: practice2,
    startDate: Date(timeIntervalSince1970: 0),
    finishDate: Date(timeIntervalSince1970: 9000),
    note: "いつもより頑張った",
    comment: [],
    prefer: []
)

let tweet2_1 = Tweet(
    user: user2,
    tweetId: tweet2.id,
    practice: practice3,
    startDate: Date(timeIntervalSince1970: 100),
    finishDate: Date(timeIntervalSince1970: 9000),
    note: "いつもよりは頑張ってなかった",
    comment: [],
    prefer: []
)

let tweet3 = Tweet(
    user: user1,
    tweetId: UUID(),
    practice: practice3,
    startDate: Date(timeIntervalSince1970: 0),
    finishDate: Date(timeIntervalSince1970: 10000),
    note: "ウルトラソウル",
    comment: [],
    prefer: []
)

let comment1 = Comment(commentId: UUID(), message: "えらい")
let comment2 = Comment(commentId: UUID(), message: "えらいっつ！")
let comment2_1 = Comment(commentId: comment2.commentId, message: "Awesome!")
let comment3 = Comment(commentId: UUID(), message: "えらいのか？")

extension Date {
    func autoCalculate(start: Date, finish: Date) -> String {
        let interval = Int(finish.timeIntervalSince(start))
        let hour = String(interval/3600)
        let minute = String((interval%3600)/60)
        var trainingTime: String
        if hour != "0", minute != "0" {
            trainingTime = hour + "時間" + minute + "分"
        } else if hour != "0" {
            trainingTime = hour + "時間"
        } else {
            trainingTime = minute + "分"
        }
        return trainingTime
    }
    
    func calculate(start: Date, finish: Date) -> [Int] {
        let interval = Int(finish.timeIntervalSince(start))
        let hour = Int(interval/3600)
        let minute = Int((interval%3600)/60)
        let trainingTime: [Int] = [hour, minute]
        return trainingTime
    }
}
