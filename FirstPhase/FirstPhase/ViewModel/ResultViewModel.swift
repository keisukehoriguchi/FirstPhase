//
//  ResultViewModel.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/06/09.
//

import Foundation

class ResultViewModel:ObservableObject {
    //       didSet {
    //           var array: [Int] = [0, 0]
    //           for tweet in someoneTweets {
    //               let hourMinute = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
    //               array[0] += hourMinute[0]
    //               array[1] += hourMinute[1]
    //           }
    //           totalHour = String("\(array[0])"+"時間"+"\(array[1])"+"分")
    //       }
    
    @Published var totalHour: String = ""
    @Published var someoneGraphArray: [Double] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    @Published var calendarCheck: [Bool] = []
    
    //期間の計算
    func calculateByDay(source: [Tweet]) {
        var array: [Int] = [0,0]
        for tweet in source {
            let hourMinmute = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            array[0] += hourMinmute[0]
            array[1] += hourMinmute[1]
        }
        totalHour = String("\(array[0])"+"時間"+"\(array[1])"+"分")
        source.filter { $0.startDate.timeIntervalSinceNow > -(60*60*24) }
    }
    
    func calculateByWeek(source: [Tweet]) {
        var array: [Int] = [0,0]
        for tweet in source {
            let hourMinmute = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            array[0] += hourMinmute[0]
            array[1] += hourMinmute[1]
        }
        totalHour = String("\(array[0])"+"時間"+"\(array[1])"+"分")
        
        source.filter { $0.startDate.timeIntervalSinceNow > -(60*60*24*7) }
    }
    
    func calculateByMonth(source: [Tweet]) {
        var array: [Int] = [0,0]
        for tweet in source {
            let hourMinmute = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            array[0] += hourMinmute[0]
            array[1] += hourMinmute[1]
        }
        totalHour = String("\(array[0])"+"時間"+"\(array[1])"+"分")
        
        let ppp = source.filter{$0.startDate.timeIntervalSinceNow > -(60*60*24*7*4)}
        
    }
    
    //最終的な計算
    func addFilterCategory(source: [Tweet], category: PracticeCategory) -> [Tweet] {
        source.filter { $0.practice.practiceCategory == category }
    }
}
