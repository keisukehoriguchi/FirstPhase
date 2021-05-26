//
//  PracticeViewModel.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/16.
//

import Foundation
import EventKit

//全てのVMはエラーの表示のためにDIが少なくとも必要じゃない？


final class PracticeViewModel: ObservableObject {
    private let practiceLogic = PracticeLogic()
    var practices: [Practice] = [practice1, practice2]
    private var eventStore = EKEventStore()
    
    init() {
        fetchPractice()
    }
    
    func addPractice(title: String, category: PracticeCategory, isPractice: Bool, needReminder: Bool) {
        let newPractice = Practice(practiceId: UUID(), name: title, practiceCategory: category, isPractice: isPractice, needsReminder: needReminder)
        practiceLogic.addPracticeToFirestore(practice: newPractice) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let newPractices):
                self.practices = newPractices
            }
        }
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
    
    func fetchPractice() {
        practiceLogic.fetchPracticesFromFirestore { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let newPractices):
                self.practices = newPractices
            }
        }
    }
    
}


extension PracticeViewModel {
    //許可のStatucを読み込む
    func getAuthorization_status() -> Bool {
        // 認証ステータスを取得
        let status = EKEventStore.authorizationStatus(for: .event)//.reminderで、リマインダーの方も指定できる。
        // ステータスの表示が許可されている場合のみtrueを返す
        switch status {
        case .notDetermined:
            print("NotDetermined")
            return false
        case .denied:
            print("Denied")
            return false
        case .authorized:
            print("Authorized")
            return true
        case .restricted:
            print("Restricted")
            return false
        @unknown default:
            fatalError("カレンダーの認証部分でエラー @unknown default")
        }
    }
    
    //許可をとるFunc
    func allowAuthorization() {
        if getAuthorization_status() {
            // 許可されているので、何もしない。
            return
        } else {
            // 許可されていないので、ユーザーに許可を得ます。
            eventStore.requestAccess(to: .event, completion: { (granted, error) in
                if granted {
                    return
                } else {
                    print("Not allowed")
                }
            })
        }
    }
}
