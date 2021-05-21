//
//  TweetViewModel.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/18.
//

import Foundation

class TweetViewModel: ObservableObject {
        private let tweetLogic = TweetLogic()
        private var tweets: [Tweet] = []

    func addTweet(user: User, practice: Practice, startDate: Date, finishDate: Date, note: String) {
        let newTweet = Tweet(user: user, tweetId: UUID(), practice: practice, startDate: startDate, finishDate: finishDate, note: note, comment: [], prefer: [])
            tweetLogic.addTweetToFirestore(tweet: newTweet) { result in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let newTweets):
                    self.tweets = newTweets
                }
            }
        }

        func deleteTweet(tweet: Tweet) {
            tweetLogic.deleteTweetFromFirestore(tweet: tweet) { result in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let newTweets):
                    self.tweets = newTweets
                }
            }
        }

        func updateTweet(tweet: Tweet) {
            tweetLogic.updateTweetToFirestore(tweet: tweet) { result in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let newTweets):
                    self.tweets = newTweets
                }
            }
        }
}
