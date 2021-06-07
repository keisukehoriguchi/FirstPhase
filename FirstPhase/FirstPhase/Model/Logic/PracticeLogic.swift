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
    var practicePath: String = "Practice"
    
    func addPracticeToFirestore(practice: Practice, _ handler: @escaping FirestoreResultHandler<[Practice]>) {
        var practices:[Practice] = []
        let documentRef = db.collection(practicePath).document(practice.id.uuidString)
        do {
            try documentRef.setData(from: practice)
        } catch let error {
            print(error.localizedDescription)
            handler(.failure(.network))
        }
        //全体読み込み部分
        db.collection(practicePath).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print(err.localizedDescription)
                handler(.failure(.network))
            } else {
                let practice = querySnapshot?.documents.compactMap { document in
                    return try? Firestore.Decoder().decode(Practice.self, from: document.data())
                }
                practices.append(contentsOf: practice ?? [])
                practices.sort { $0.id.uuidString > $1.id.uuidString }
                handler(.success(practices))
            }
        }
    }
    
    func deletePracticeFromFirestore(practice: Practice, _ handler: @escaping FirestoreResultHandler<[Practice]>) {
        var practices:[Practice] = []
        db.collection(practicePath).document(practice.id.uuidString).delete()
        
        db.collection(practicePath).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print(err.localizedDescription)
                handler(.failure(.network))
            } else {
                let practice = querySnapshot?.documents.compactMap { document in
                    return try? Firestore.Decoder().decode(Practice.self, from: document.data())
                }
                practices.append(contentsOf: practice ?? [])
                practices.sort { $0.id.uuidString > $1.id.uuidString }
                handler(.success(practices))
            }
        }
    }
    
    func updatePracticeToFirestore(practice: Practice, _ handler: @escaping FirestoreResultHandler<[Practice]>) {
        var practices:[Practice] = []
        let documentRef = db.collection(practicePath).document(practice.id.uuidString)
        do {
            try documentRef.setData(from: practice, merge: true)
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
                practices.sort { $0.id.uuidString > $1.id.uuidString }
                handler(.success(practices))
            }
        }
    }
    
    func fetchPracticesFromFirestore( _ handler: @escaping FirestoreResultHandler<[Practice]>) {
        var practices:[Practice] = []
        db.collection(practicePath).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print(err.localizedDescription)
                handler(.failure(.network))
            } else {
                let practice = querySnapshot?.documents.compactMap { document in
                    return try? Firestore.Decoder().decode(Practice.self, from: document.data())
                }
                practices.append(contentsOf: practice ?? [])
                practices.sort { $0.id.uuidString > $1.id.uuidString }
                handler(.success(practices))
            }
        }
    }
}
