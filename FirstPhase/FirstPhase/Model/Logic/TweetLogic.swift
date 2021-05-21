//
//  TweetLogic.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/18.
//

import Foundation

struct TweetLogic {
    
    func addTweetToFirestore(tweet: Tweet, _ handler: @escaping FirestoreResultHandler<[Tweet]>) {
            //Firestoreへの保存での条件分岐
            handler(.failure(.logic))
            handler(.failure(.network))
            let tweets:[Tweet] = []
            handler(.success(tweets))
        }
    
        func deleteTweetFromFirestore(tweet: Tweet, _ handler: @escaping FirestoreResultHandler<[Tweet]>) {
            //Firestoreへの保存での条件分岐
            handler(.failure(.logic))
            handler(.failure(.network))
            let tweets:[Tweet] = []
            handler(.success(tweets))
    
        }
    
        func updateTweetToFirestore(tweet: Tweet, _ handler: @escaping FirestoreResultHandler<[Tweet]>) {
            //Firestoreへの保存での条件分岐
            handler(.failure(.logic))
            handler(.failure(.network))
            let tweets:[Tweet] = []
            handler(.success(tweets))
        }
    
        func fetchTweetsFromFirestore( _ handler: @escaping FirestoreResultHandler<[Tweet]>) {
            //Firestoreへの保存での条件分岐
            handler(.failure(.logic))
            handler(.failure(.network))
            let tweets:[Tweet] = []
            handler(.success(tweets))
        }
    
}
