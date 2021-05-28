//
//  CommentLogic.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/20.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct CommentLogic {
    
    private let db = Firestore.firestore()
    var commentPath: String = "Comment"
    
    func addCommentToFirestore(comment: Comment, _ handler: @escaping FirestoreResultHandler<[Comment]>) {
        var comments:[Comment] = []
        let documentRef = db.collection(commentPath).document(comment.commentId.uuidString)
        do {
            try documentRef.setData(from: comment)
        } catch let error {
            print(error.localizedDescription)
            handler(.failure(.network))
        }
        //全体読み込み部分
        db.collection(commentPath).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print(err.localizedDescription)
                handler(.failure(.network))
            } else {
                let comment = querySnapshot?.documents.compactMap { document in
                    return try? Firestore.Decoder().decode(Comment.self, from: document.data())
                }
                comments.append(contentsOf: comment ?? [])
                
                
                comments.sort { $0.commentId.uuidString > $1.commentId.uuidString }
                handler(.success(comments))
            }
        }
    }
    
    func deleteCommentFromFirestore(comment: Comment, _ handler: @escaping FirestoreResultHandler<[Comment]>) {
        var comments:[Comment] = []
        db.collection(commentPath).document(comment.commentId.uuidString).delete()
        
        //全体読み込み部分
        db.collection(commentPath).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print(err.localizedDescription)
                handler(.failure(.network))
            } else {
                let comment = querySnapshot?.documents.compactMap { document in
                    return try? Firestore.Decoder().decode(Comment.self, from: document.data())
                }
                comments.append(contentsOf: comment ?? [])
                
                
                comments.sort { $0.commentId.uuidString > $1.commentId.uuidString }
                handler(.success(comments))
            }
        }
    }
    
    func updateCommentToFirestore(comment: Comment, _ handler: @escaping FirestoreResultHandler<[Comment]>) {
        var comments:[Comment] = []
        let documentRef = db.collection(commentPath).document(comment.commentId.uuidString)
        do {
            try documentRef.setData(from: comment, merge: true)
        } catch let error {
            print(error.localizedDescription)
            handler(.failure(.network))
        }
        //全体読み込み部分
        db.collection(commentPath).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print(err.localizedDescription)
                handler(.failure(.network))
            } else {
                let comment = querySnapshot?.documents.compactMap { document in
                    return try? Firestore.Decoder().decode(Comment.self, from: document.data())
                }
                comments.append(contentsOf: comment ?? [])
                
                
                comments.sort { $0.commentId.uuidString > $1.commentId.uuidString }
                handler(.success(comments))
            }
        }
    }
    
    func fetchCommentsFromFirestore( _ handler: @escaping FirestoreResultHandler<[Comment]>) {
        var comments:[Comment] = []
        db.collection(commentPath).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print(err.localizedDescription)
                handler(.failure(.network))
            } else {
                let comment = querySnapshot?.documents.compactMap { document in
                    return try? Firestore.Decoder().decode(Comment.self, from: document.data())
                }
                comments.append(contentsOf: comment ?? [])
                
                
                comments.sort { $0.commentId.uuidString > $1.commentId.uuidString }
                handler(.success(comments))
            }
        }
    }
}
