//
//  Practice.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/14.
//

import Foundation
import EventKit

struct Practice: Codable, Equatable {
    var practiceId: UUID
    var name: String
    var practiceCategory: PracticeCategory
    var isPractice: Bool
    var needsReminder: Bool
    //EKReminderはCodableにしずらそうだから、参照だけ渡して関連づけた方がいいかも。
//    var reminder: EKReminder?
}

enum PracticeCategory: String, CaseIterable, Codable {
    case musicCreation = "musicCreation"
    case novelmangaCreation = "novelmangaCreation"
    case illustrationCreation = "illustrationCreation"
    case movieProduction = "movieProduction"
    case appProgramCreation = "appProgramCreation"
    case accyClothDIY = "accyClothDIY"
    case livePerformance = "livePerformance"
    case sports = "sports"
}
