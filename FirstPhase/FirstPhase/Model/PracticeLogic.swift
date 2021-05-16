//
//  PracticeLogic.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/16.
//

import Foundation

struct PracticeLogic{
    
    func preparePracticeToAdd(title: String, category: PracticeCategory) -> Practice {
        let practice = Practice(name: title, practiceCategory: category, isPractice: false, needsReminder: false, reminder: nil)
        return practice
    }
    
    func addPracticeToFirestore(){
        
    }
    
}
