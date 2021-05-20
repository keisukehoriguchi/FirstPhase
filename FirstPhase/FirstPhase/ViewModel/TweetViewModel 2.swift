//
//  TweetViewModel.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/18.
//

import Foundation

class TweetViewModel {
        private let tweetLogic = TweetLogic()
        private var tweets: [Tweet] = []

        func addTweet(title: String) {
            tweetLogic.addTweetToFirestore(title: title) { result in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let newTweets):
                    self.tweets = newTweets
                }
            }
        }

        func deletePractice(practice: Practice) {
            tweetLogic.deleteTweetFromFirestore(practice: practice) { result in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let newTweets):
                    self.tweets = newTweets
                }
            }
        }

        func updatePractice(practice: Practice) {
            tweetLogic.updateTweetToFirestore(practice: practice) { result in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let newTweets):
                    self.tweets = newTweets
                }
            }
        }
}
