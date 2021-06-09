//
//  TweetViewModel.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/18.
//

import Foundation

class TweetViewModel: ObservableObject {
    @Published var tweets: [Tweet] = [tweet1, tweet2, tweet3]
    @Published var someoneTweets: [Tweet] = []
    
    private let tweetLogic = TweetLogic()
    
    init() {
        fetchTweets()
    }
    
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
    
    func fetchTweets() {
        tweetLogic.fetchTweetsFromFirestore { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let newTweets):
                self.tweets = newTweets
            }
        }
    }
}
