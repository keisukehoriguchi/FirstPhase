//
//  ResultViewModel.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/06/09.
//

import Foundation

class ResultViewModel:ObservableObject {
    
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
        
        var firstArray = [0,0]
        source.filter { $0.startDate.timeIntervalSinceNow > -(60*60*24) }.forEach { tweet in
            let array = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            firstArray[0] += array[0]
            firstArray[1] += array[1]
        }
        
        var secondArray = [0,0]
        source.filter{ $0.startDate.timeIntervalSinceNow < -(60*60*24*1)}.filter{ $0.startDate.timeIntervalSinceNow > -(60*60*24*2)}.forEach { tweet in
            let array = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            secondArray[0] += array[0]
            secondArray[1] += array[1]
        }
        
        var thirdArray = [0,0]
        source.filter{ $0.startDate.timeIntervalSinceNow < -(60*60*24*2)}.filter{ $0.startDate.timeIntervalSinceNow > -(60*60*24*3)}.forEach { tweet in
            let array = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            thirdArray[0] += array[0]
            thirdArray[1] += array[1]
        }
        
        var forthArray = [0,0]
        source.filter{ $0.startDate.timeIntervalSinceNow < -(60*60*24*3)}.filter{ $0.startDate.timeIntervalSinceNow > -(60*60*24*4)}.forEach { tweet in
            let array = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            forthArray[0] += array[0]
            forthArray[1] += array[1]
        }
        
        var fifthArray = [0,0]
        source.filter{ $0.startDate.timeIntervalSinceNow < -(60*60*24*4)}.filter{ $0.startDate.timeIntervalSinceNow > -(60*60*24*5)}.forEach { tweet in
            let array = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            fifthArray[0] += array[0]
            fifthArray[1] += array[1]
        }
        
        var sixthArray = [0,0]
        source.filter{ $0.startDate.timeIntervalSinceNow < -(60*60*24*5)}.filter{ $0.startDate.timeIntervalSinceNow > -(60*60*24*6)}.forEach { tweet in
            let array = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            sixthArray[0] += array[0]
            sixthArray[1] += array[1]
        }
        
//        let a = source.filter{ $0.startDate.timeIntervalSinceNow < -(60*60*24*5)}.filter{ $0.startDate.timeIntervalSinceNow > -(60*60*24*6)}.reduce(0.0, { x, y in
//            x + Double(Date().calculate(start: y.startDate, finish: y.finishDate)[0])*3600 + Double(Date().calculate(start: y.startDate, finish: y.finishDate)[1])
//        })
//
//        print(a)
        
    }
    
    func calculateByWeek(source: [Tweet]) {
        var array: [Int] = [0,0]
        for tweet in source {
            let hourMinmute = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            array[0] += hourMinmute[0]
            array[1] += hourMinmute[1]
        }
        totalHour = String("\(array[0])"+"時間"+"\(array[1])"+"分")
        
        var firstArray = [0,0]
        source.filter { $0.startDate.timeIntervalSinceNow > -(60*60*24*7) }.forEach { tweet in
            let array = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            firstArray[0] += array[0]
            firstArray[1] += array[1]
        }
        
        var secondArray = [0,0]
        source.filter{ $0.startDate.timeIntervalSinceNow < -(60*60*24*7*1)}.filter{ $0.startDate.timeIntervalSinceNow > -(60*60*24*7*2)}.forEach { tweet in
            let array = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            secondArray[0] += array[0]
            secondArray[1] += array[1]
        }
        
        var thirdArray = [0,0]
        source.filter{ $0.startDate.timeIntervalSinceNow < -(60*60*24*7*2)}.filter{ $0.startDate.timeIntervalSinceNow > -(60*60*24*7*3)}.forEach { tweet in
            let array = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            thirdArray[0] += array[0]
            thirdArray[1] += array[1]
        }
        
        var forthArray = [0,0]
        source.filter{ $0.startDate.timeIntervalSinceNow < -(60*60*24*7*3)}.filter{ $0.startDate.timeIntervalSinceNow > -(60*60*24*7*4)}.forEach { tweet in
            let array = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            forthArray[0] += array[0]
            forthArray[1] += array[1]
        }
        
        var fifthArray = [0,0]
        source.filter{ $0.startDate.timeIntervalSinceNow < -(60*60*24*7*4)}.filter{ $0.startDate.timeIntervalSinceNow > -(60*60*24*7*5)}.forEach { tweet in
            let array = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            fifthArray[0] += array[0]
            fifthArray[1] += array[1]
        }
        
        var sixthArray = [0,0]
        source.filter{ $0.startDate.timeIntervalSinceNow < -(60*60*24*7*5)}.filter{ $0.startDate.timeIntervalSinceNow > -(60*60*24*7*6)}.forEach { tweet in
            let array = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            sixthArray[0] += array[0]
            sixthArray[1] += array[1]
        }
    }
    
    func calculateByMonth(source: [Tweet]) {
        var array: [Int] = [0,0]
        for tweet in source {
            let hourMinmute = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            array[0] += hourMinmute[0]
            array[1] += hourMinmute[1]
        }
        totalHour = String("\(array[0])"+"時間"+"\(array[1])"+"分")
        
        var firstArray = [0,0]
        source.filter{$0.startDate.timeIntervalSinceNow > -(60*60*24*7*4.5)}.forEach { tweet in
            let array = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            firstArray[0] += array[0]
            firstArray[1] += array[1]
        }
        
        var secondArray = [0,0]
        source.filter{ $0.startDate.timeIntervalSinceNow < -(60*60*24*7*4.3)}.filter{ $0.startDate.timeIntervalSinceNow > -(60*60*24*7*8.6)}.forEach { tweet in
            let array = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            secondArray[0] += array[0]
            secondArray[1] += array[1]
        }
        
        var thirdArray = [0,0]
        source.filter{ $0.startDate.timeIntervalSinceNow < -(60*60*24*7*8.6)}.filter{ $0.startDate.timeIntervalSinceNow > -(60*60*24*7*12.9)}.forEach { tweet in
            let array = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            thirdArray[0] += array[0]
            thirdArray[1] += array[1]
        }
        
        var forthArray = [0,0]
        source.filter{ $0.startDate.timeIntervalSinceNow < -(60*60*24*7*12.9)}.filter{ $0.startDate.timeIntervalSinceNow > -(60*60*24*7*17.3)}.forEach { tweet in
            let array = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            forthArray[0] += array[0]
            forthArray[1] += array[1]
        }
        
        var fifthArray = [0,0]
        source.filter{ $0.startDate.timeIntervalSinceNow < -(60*60*24*7*17.3)}.filter{ $0.startDate.timeIntervalSinceNow > -(60*60*24*7*21.6)}.forEach { tweet in
            let array = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            fifthArray[0] += array[0]
            fifthArray[1] += array[1]
        }
        
        var sixthArray = [0,0]
        source.filter{ $0.startDate.timeIntervalSinceNow < -(60*60*24*7*21.6)}.filter{ $0.startDate.timeIntervalSinceNow > -(60*60*24*7*25.9)}.forEach { tweet in
            let array = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            sixthArray[0] += array[0]
            sixthArray[1] += array[1]
        }
    }
    
    //最終的な計算
    func addFilterCategory(source: [Tweet], category: PracticeCategory) -> [Tweet] {
        source.filter { $0.practice.practiceCategory == category }
    }
    
    func checkBoolByCalender(calendar: [Int]) {
        
        for item in calendar {
            
        }
        
        
        
    }
}
