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
    @Published var userViewModel: UserViewModel = UserViewModel()
    
    init() {
        fetchTweets()
        setThisMonth()
        calendarCheck = resultLogic.checkBoolByCalender(year: date.year, month: date.month, tweets: someoneTweets, calendar: calendarArray)
        totalHour = resultLogic.calculateByDayforTotalHour(source: someoneTweets)
        someoneGraphArray = resultLogic.calculateByDayforGraphPoints(source: someoneTweets)
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
        tweetLogic.fetchTweetsFromFirestore(follow: <#[UUID]#>) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let newTweets):
                self.tweets = newTweets
            }
        }
    }
    
    func fetchSomeoneTweets(userId: UUID) {
        tweetLogic.fetchSomeoneTweetsFromFirestore(userId: <#T##UUID#>) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let newTweets):
                self.someoneTweets = newTweets
            }
        }
    }
    
    //リザルト用のロジック
    @Published var totalHour: String = ""
    @Published var someoneGraphArray: [Double] = [0.3, 0.5, 0.8, 0.4, 0.6, 0.2]
    @Published var calendarCheck: [Bool] = []
    
    private let resultLogic = ResultLogic()
    
    func update(source: [Tweet]) {
        calendarCheck = resultLogic.checkBoolByCalender(year: date.year, month: date.month, tweets: source, calendar: calendarArray)
        totalHour = resultLogic.calculateByDayforTotalHour(source: source)
        someoneGraphArray = resultLogic.calculateByDayforGraphPoints(source: source)
    }

    //リザルト用のロジック
    
    //カレンダーのロジック
    private let calendarLogic = CalendarLogic()
    private let date = DateItems.ThisMonth.Request()
    var calendarArray: [Int] = []
    var monthCounter = 0
    
    
    func setThisMonth() {
        monthCounter = 0
        calendarArray = calendarLogic.dateManager(year: date.year, month: date.month)
    }
    
    func moveTheMonth() {
        let theDate = DateItems.MoveMonth.Request(monthCounter)
        calendarArray = calendarLogic.dateManager(year: theDate.year, month: theDate.month)
    }
    //カレンダーのロジック
}
