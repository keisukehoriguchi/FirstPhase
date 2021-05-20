//
//  CommentLogic.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/20.
//

import Foundation

struct CommentLogic {
    func addCommentToFirestore(title: String, _ handler: @escaping FirestoreResultHandler<[Comment]>) {
        //Firestoreへの保存での条件分岐
        handler(.failure(.logic))
        handler(.failure(.network))
        let comments:[Comment] = []
        handler(.success(comments))
        
    }
    
    func deleteCommentFromFirestore(comment: Comment, _ handler: @escaping FirestoreResultHandler<[Comment]>) {
        //Firestoreへの保存での条件分岐
        handler(.failure(.logic))
        handler(.failure(.network))
        let comments:[Comment] = []
        handler(.success(comments))
        
    }
    
    func updateCommentToFirestore(comment: Comment, _ handler: @escaping FirestoreResultHandler<[Comment]>) {
        //Firestoreへの保存での条件分岐
        handler(.failure(.logic))
        handler(.failure(.network))
        let comments:[Comment] = []
        handler(.success(comments))
    }
    
    func fetchCommentsFromFirestore( _ handler: @escaping FirestoreResultHandler<[Comment]>) {
        //Firestoreへの保存での条件分岐
        handler(.failure(.logic))
        handler(.failure(.network))
        let comments:[Comment] = []
        handler(.success(comments))
    }
}
