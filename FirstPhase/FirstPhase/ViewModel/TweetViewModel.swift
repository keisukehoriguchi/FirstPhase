//
//  TweetViewModel.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/18.
//

import Foundation

//struct TweetViewModel {
//        private let tweetLogic = TweetLogic()
//        private var tweets: [Tweet] = []
//
//        mutating func addTweet(title: String) {
//            tweetLogic.addTweetToFirestore(title: title) { result in
//                switch result {
//                case .failure(let error):
//                    print(error.localizedDescription)
//                case .success(let newTweets):
//                    tweets = newTweets
//                }
//            }
//        }
//
//        mutating func deletePractice(practice: Practice) {
//            tweetLogic.deleteTweetFromFirestore(practice: practice) { result in
//                switch result {
//                case .failure(let error):
//                    print(error.localizedDescription)
//                case .success(let newTweets):
//                    tweets = newTweets
//                }
//            }
//        }
//
//        mutating func updatePractice(practice: Practice) {
//            tweetLogic.updateTweetToFirestore(practice: practice) { result in
//                switch result {
//                case .failure(let error):
//                    print(error.localizedDescription)
//                case .success(let newTweets):
//                    tweets = newTweets
//                }
//            }
//        }
//}
