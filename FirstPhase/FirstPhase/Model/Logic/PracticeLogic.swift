//
//  PracticeLogic.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/16.
//

import Foundation
import EventKit
import FirebaseFirestore
import FirebaseFirestoreSwift



struct PracticeLogic{
    
    private let db = Firestore.firestore()
    private let practicePath: String = "Practice"
    
    func addPracticeToFirestore(practice: Practice, _ handler: @escaping FirestoreResultHandler<[Practice]>) {
        //Practice返すのではなくデータベースにアクセスして、直接書き換えるみたいな役割にした方がいい。ViewModel部分で該当の部分を読み込むようにする。
        
        var practices:[Practice] = []
        let documentRef = db.collection(practicePath).document(practice.practiceId.uuidString)
        do {
            try documentRef.setData(from: practice)
        } catch let error {
            print(error.localizedDescription)
            handler(.failure(.network))
        }
        
        db.collection(practicePath).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print(err.localizedDescription)
                handler(.failure(.network))
            } else {
                let practice = querySnapshot?.documents.compactMap { document in
                    return try? Firestore.Decoder().decode(Practice.self, from: document.data())
                }
                practices.append(contentsOf: practice ?? [])
                handler(.success(practices))
            }
        }
        
        
    }
    
    func deletePracticeFromFirestore(practice: Practice, _ handler: @escaping FirestoreResultHandler<[Practice]>) {
        //Firestoreへの保存での条件分岐
        handler(.failure(.logic))
        handler(.failure(.network))
        let practices: [Practice] = []
        handler(.success(practices))
        
    }
    
    func updatePracticeToFirestore(practice: Practice, _ handler: @escaping FirestoreResultHandler<[Practice]>) {
        //Firestoreへの保存での条件分岐
        handler(.failure(.logic))
        handler(.failure(.network))
        let practices: [Practice] = []
        handler(.success(practices))
    }
    
    func fetchPracticesFromFirestore( _ handler: @escaping FirestoreResultHandler<[Practice]>) {
        //Firestoreへの保存での条件分岐
        handler(.failure(.logic))
        handler(.failure(.network))
        let practices: [Practice] = []
        handler(.success(practices))
        
    }
    
}
