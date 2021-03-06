//
//  TweetLogic.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/18.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct TweetLogic{
    
    var tweetPath: String = "Tweet"
    private let db = Firestore.firestore()
    
    func addTweetToFirestore(tweet: Tweet, _ handler: @escaping FirestoreResultHandler<[Tweet]>) {
        var tweets:[Tweet] = []
        let documentRef = db.collection(tweetPath).document(tweet.id.uuidString)
        do {
            try documentRef.setData(from: tweet)
        } catch let error {
            print(error.localizedDescription)
            handler(.failure(.network))
        }
        //全体読み込み部分
        db.collection(tweetPath).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print(err.localizedDescription)
                handler(.failure(.network))
            } else {
                let tweet = querySnapshot?.documents.compactMap { document in
                    return try? Firestore.Decoder().decode(Tweet.self, from: document.data())
                }
                tweets.append(contentsOf: tweet ?? [])
                tweets.sort { $0.startDate > $1.startDate }
                handler(.success(tweets))
            }
        }
    }
    
    func deleteTweetFromFirestore(tweet: Tweet, _ handler: @escaping FirestoreResultHandler<[Tweet]>) {
        var tweets:[Tweet] = []
        db.collection(tweetPath).document(tweet.id.uuidString).delete()
        
        //全体読み込み部分
        db.collection(tweetPath).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print(err.localizedDescription)
                handler(.failure(.network))
            } else {
                let tweet = querySnapshot?.documents.compactMap { document in
                    return try? Firestore.Decoder().decode(Tweet.self, from: document.data())
                }
                tweets.append(contentsOf: tweet ?? [])
                tweets.sort { $0.startDate > $1.startDate }
                handler(.success(tweets))
            }
        }
    }
    
    func updateTweetToFirestore(tweet: Tweet, _ handler: @escaping FirestoreResultHandler<[Tweet]>) {
        var tweets:[Tweet] = []
        let documentRef = db.collection(tweetPath).document(tweet.id.uuidString)
        do {
            try documentRef.setData(from: tweet, merge: true)
        } catch let error {
            print(error.localizedDescription)
            handler(.failure(.network))
        }
        //全体読み込み部分
        db.collection(tweetPath).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print(err.localizedDescription)
                handler(.failure(.network))
            } else {
                let tweet = querySnapshot?.documents.compactMap { document in
                    return try? Firestore.Decoder().decode(Tweet.self, from: document.data())
                }
                tweets.append(contentsOf: tweet ?? [])
                tweets.sort { $0.startDate > $1.startDate }
                handler(.success(tweets))
            }
        }
    }
    
    func fetchTweetsFromFirestore(follow: [UUID], _ handler: @escaping FirestoreResultHandler<[Tweet]>) {
        var tweets:[Tweet] = []
        //全体読み込み部分
        db.collection(tweetPath).whereField("userId", in: follow ).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print(err.localizedDescription)
                handler(.failure(.network))
            } else {
                let tweet = querySnapshot?.documents.compactMap { document in
                    return try? Firestore.Decoder().decode(Tweet.self, from: document.data())
                }
                tweets.append(contentsOf: tweet ?? [])
                tweets.sort { $0.startDate > $1.startDate }
                handler(.success(tweets))
            }
        }
    }
    
    func fetchSomeoneTweetsFromFirestore(userId: UUID,  _ handler: @escaping FirestoreResultHandler<[Tweet]>) {
        var tweets:[Tweet] = []
        //全体読み込み部分
        db.collection(tweetPath).whereField("userId", isEqualTo: userId).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print(err.localizedDescription)
                handler(.failure(.network))
            } else {
                let tweet = querySnapshot?.documents.compactMap { document in
                    return try? Firestore.Decoder().decode(Tweet.self, from: document.data())
                }
                tweets.append(contentsOf: tweet ?? [])
                tweets.sort { $0.startDate > $1.startDate }
                handler(.success(tweets))
            }
        }
    }
}
