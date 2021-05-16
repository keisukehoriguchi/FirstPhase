//
//  Practice.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/14.
//

import Foundation
import EventKit

struct Practice {
    let id: UUID = UUID()
    var name: String
    var practiceCategory: PracticeCategory
    var isPractice: Bool
    var needsReminder: Bool
    var reminder: EKReminder?
}

enum PracticeCategory: String, CaseIterable {
    case musicCreation = "musicCreation"
    case novelmangaCreation = "novelmangaCreation"
    case illustrationCreation = "illustrationCreation"
    case movieProduction = "movieProduction"
    case appProgramCreation = "appProgramCreation"
    case accyClothDIY = "accyClothDIY"
    case livePerformance = "livePerformance"
    case sports = "sports"
}
