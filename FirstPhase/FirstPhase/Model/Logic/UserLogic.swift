//
//  UserLogic.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/18.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserLogic {
    
    var userPath: String = "User"
    private let db = Firestore.firestore()
    
    func addUserToFirestore(userId: UUID, _ handler: @escaping FirestoreResultHandler<User>) {
        let user:User = User(id: userId, name: "", icon: "", profile: "")
        let documentRef = db.collection(userPath).document(userId.uuidString)
        do {
            try documentRef.setData(from: user)
        } catch let error {
            print(error.localizedDescription)
            handler(.failure(.network))
        }
        //全体読み込み部分
        documentRef.getDocument { snapshot, error in
            if let error = error {
                debugPrint(error.localizedDescription)
            } else if let data = snapshot?.data() {
                if let user = try? Firestore.Decoder().decode(User.self, from: data) {
                    handler(.success(user))
                } else {
                    handler(.failure(.other))
                }
            }
        }
    }
    
    func updateUserToFirestore(user: User, _ handler: @escaping FirestoreResultHandler<User>) {
        
        let documentRef = db.collection(userPath).document(user.id.uuidString)
        
        do {
            try documentRef.setData(from: user, merge: true)
        } catch let error {
            print(error.localizedDescription)
            handler(.failure(.network))
        }
        //全体読み込み部分
        documentRef.getDocument { snapshot, error in
            if let error = error {
                debugPrint(error.localizedDescription)
            } else if let data = snapshot?.data() {
                if let user = try? Firestore.Decoder().decode(User.self, from: data) {
                    handler(.success(user))
                } else {
                    handler(.failure(.other))
                }
            }
        }
    }
    
    func fetchPracticesFromFirestore(userId: UUID, _ handler: @escaping FirestoreResultHandler<User>) {

        let documentRef = db.collection(userPath).document(userId.uuidString)
        documentRef.getDocument { snapshot, error in
            if let error = error {
                debugPrint(error.localizedDescription)
            } else if let data = snapshot?.data() {
                if let user = try? Firestore.Decoder().decode(User.self, from: data) {
                    handler(.success(user))
                } else {
                    handler(.failure(.other))
                }
            }
        }
    }
    
}
