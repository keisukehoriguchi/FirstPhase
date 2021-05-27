//
//  SampleData.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/14.
//
import Foundation

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
