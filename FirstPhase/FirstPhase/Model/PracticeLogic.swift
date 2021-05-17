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
        //Practice返すのではなくデータベースにアクセスして、直接書き換えるみたいな役割にした方がいい。ViewModel部分で該当の部分を読み込むようにする。
        return practice
    }
    
    func deletePracticeFromFirestore(practice: Practice, _ handler: @escaping FirestoreResultHandler<[Practice]>) {
        //Firestoreへの保存での条件分岐
        handler(.failure(.logic))
        handler(.failure(.network))
        handler(.success(<#[Practice]#>))
        
    }
    
    func updatePracticeToFirestore(practice: Practice, _ handler: @escaping FirestoreResultHandler<[Practice]>) {
        //Firestoreへの保存での条件分岐
        handler(.failure(.logic))
        handler(.failure(.network))
        handler(.success(<#[Practice]#>))
    }
    
    func fetchPracticesFromFirestore( _ handler: @escaping FirestoreResultHandler<[Practice]>) {
        //Firestoreへの保存での条件分岐
        handler(.failure(.logic))
        handler(.failure(.network))
        handler(.success(<#[Practice]#>))
        
    }
    
}
