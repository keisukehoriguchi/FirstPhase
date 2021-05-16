//
//  PracticeViewModel.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/16.
//

import Foundation

class PracticeViewModel: ObservableObject {
    private let practiceLogic = PracticeLogic()
    private var practices: [Practice] = []
    
    func addPractice(title: String, category: PracticeCategory) {
        let newPractice = practiceLogic.preparePracticeToAdd(title: title, category: category)
        practices.append(newPractice)
    }
    
    
}
