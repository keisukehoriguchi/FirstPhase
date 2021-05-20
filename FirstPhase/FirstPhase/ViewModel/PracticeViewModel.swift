//
//  PracticeViewModel.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/16.
//

import Foundation

final class PracticeViewModel: ObservableObject {
    private let practiceLogic = PracticeLogic()
    private var practices: [Practice] = []
    
    func addPractice(title: String, category: PracticeCategory) {
        let newPractice = practiceLogic.preparePracticeToAdd(title: title, category: category)
        practices.append(newPractice)
    }
    
    func deletePractice(practice: Practice) {
        practiceLogic.deletePracticeFromFirestore(practice: practice) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let newPractices):
                self.practices = newPractices
            }
        }
    }
    
    func updatePractice(practice: Practice) {
        practiceLogic.updatePracticeToFirestore(practice: practice) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let newPractices):
                self.practices = newPractices
            }
        }
    }
}
