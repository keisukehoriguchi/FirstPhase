//
//  UserLogic.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/18.
//

import Foundation

struct UserLogic {
    
    func addUserToFirestore(userId: UUID, _ handler: @escaping FirestoreResultHandler<User>) {
        //Firestoreへの保存での条件分岐
        handler(.failure(.logic))
        handler(.failure(.network))
        let user = User(id: UUID(), name: "", icon: "", profile: "")
        handler(.success(user))
        
    }
    
    func updateUserToFirestore(user: User, _ handler: @escaping FirestoreResultHandler<User>) {
        //Firestoreへの保存での条件分岐
        handler(.failure(.logic))
        handler(.failure(.network))
        let user = User(id: UUID(), name: "", icon: "", profile: "")
        handler(.success(user))
    }
    
    func fetchPracticesFromFirestore( _ handler: @escaping FirestoreResultHandler<User>) {
        //Firestoreへの保存での条件分岐
        handler(.failure(.logic))
        handler(.failure(.network))
        let user = User(id: UUID(), name: "", icon: "", profile: "")
        handler(.success(user))
        
    }
    
}
