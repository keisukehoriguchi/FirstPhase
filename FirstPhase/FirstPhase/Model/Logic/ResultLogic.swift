//
//  ResultLogic.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/06/10.
//

import Foundation

struct ResultLogic {
    
    //期間の計算
    func calculateByDayforTotalHour(source: [Tweet]) -> String {
        var array: [Int] = [0,0]
        for tweet in source {
            let hourMinmute = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            array[0] += hourMinmute[0]
            array[1] += hourMinmute[1]
        }
        return String("\(array[0])"+"時間"+"\(array[1])"+"分")
    }
    
    func calculateByDayforGraphPoints(source: [Tweet]) -> [Double] {
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
        
        var first:Double = 0.0
        var second:Double = 0.0
        var third:Double = 0.0
        var forth:Double = 0.0
        var fifth:Double = 0.0
        var sixth:Double = 0.0
        
        if (firstArray[0]+firstArray[1]) != 0 { first = Double(1-1/(firstArray[0]+firstArray[1])) } else { first = 1.0 }
        if (secondArray[0]+secondArray[1]) != 0 { second = Double(1-1/(secondArray[0]+secondArray[1])) } else { second = 1.0 }
        if (thirdArray[0]+thirdArray[1]) != 0 { third = Double(1-1/(thirdArray[0]+thirdArray[1])) } else { third = 1.0 }
        if (forthArray[0]+forthArray[1]) != 0 { forth = Double(1-1/(forthArray[0]+forthArray[1])) } else { forth = 1.0 }
        if (fifthArray[0]+fifthArray[1]) != 0 { fifth = Double(1-1/(fifthArray[0]+fifthArray[1])) } else { fifth = 1.0 }
        if (sixthArray[0]+sixthArray[1]) != 0 { sixth = Double(1-1/(sixthArray[0]+sixthArray[1])) } else { sixth = 1.0 }
        
        return [first, second, third, forth, fifth, sixth]
        
    }
    
    func calculateByWeekforTotalHour(source: [Tweet]) -> String {
        var array: [Int] = [0,0]
        for tweet in source {
            let hourMinmute = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            array[0] += hourMinmute[0]
            array[1] += hourMinmute[1]
        }
        return String("\(array[0])"+"時間"+"\(array[1])"+"分")
    }
    
    func calculateByWeekforGraphPoints(source: [Tweet]) -> [Double] {
        
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
        
        var first:Double = 0.0
        var second:Double = 0.0
        var third:Double = 0.0
        var forth:Double = 0.0
        var fifth:Double = 0.0
        var sixth:Double = 0.0
        
        if (firstArray[0]+firstArray[1]) != 0 { first = Double(1-1/(firstArray[0]+firstArray[1])) } else { first = 1.0 }
        if (secondArray[0]+secondArray[1]) != 0 { second = Double(1-1/(secondArray[0]+secondArray[1])) } else { second = 1.0 }
        if (thirdArray[0]+thirdArray[1]) != 0 { third = Double(1-1/(thirdArray[0]+thirdArray[1])) } else { third = 1.0 }
        if (forthArray[0]+forthArray[1]) != 0 { forth = Double(1-1/(forthArray[0]+forthArray[1])) } else { forth = 1.0 }
        if (fifthArray[0]+fifthArray[1]) != 0 { fifth = Double(1-1/(fifthArray[0]+fifthArray[1])) } else { fifth = 1.0 }
        if (sixthArray[0]+sixthArray[1]) != 0 { sixth = Double(1-1/(sixthArray[0]+sixthArray[1])) } else { sixth = 1.0 }
        
        return [first, second, third, forth, fifth, sixth]
    }
    
    
    func calculateByMonthForTotalHour(source: [Tweet]) -> String {
        var array: [Int] = [0,0]
        for tweet in source {
            let hourMinmute = Date().calculate(start: tweet.startDate, finish: tweet.finishDate)
            array[0] += hourMinmute[0]
            array[1] += hourMinmute[1]
        }
        return String("\(array[0])"+"時間"+"\(array[1])"+"分")
    }
    
    func calculateByMonthForGraphPoints(source: [Tweet]) -> [Double] {
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
        
        var first:Double = 0.0
        var second:Double = 0.0
        var third:Double = 0.0
        var forth:Double = 0.0
        var fifth:Double = 0.0
        var sixth:Double = 0.0
        
        if (firstArray[0]+firstArray[1]) != 0 { first = Double(1-1/(firstArray[0]+firstArray[1])) } else { first = 1.0 }
        if (secondArray[0]+secondArray[1]) != 0 { second = Double(1-1/(secondArray[0]+secondArray[1])) } else { second = 1.0 }
        if (thirdArray[0]+thirdArray[1]) != 0 { third = Double(1-1/(thirdArray[0]+thirdArray[1])) } else { third = 1.0 }
        if (forthArray[0]+forthArray[1]) != 0 { forth = Double(1-1/(forthArray[0]+forthArray[1])) } else { forth = 1.0 }
        if (fifthArray[0]+fifthArray[1]) != 0 { fifth = Double(1-1/(fifthArray[0]+fifthArray[1])) } else { fifth = 1.0 }
        if (sixthArray[0]+sixthArray[1]) != 0 { sixth = Double(1-1/(sixthArray[0]+sixthArray[1])) } else { sixth = 1.0 }
        
        return [first, second, third, forth, fifth, sixth]
    }
    
    //最終的な計算
    func addFilterCategory(source: [Tweet], category: PracticeCategory) -> [Tweet] {
        source.filter { $0.practice.practiceCategory == category }
    }
    
    func checkBoolByCalender(year:Int, month: Int, tweets: [Tweet],calendar: [Int]) -> [Bool] {
        
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .medium
        
        var boolArray: [Bool] = []
        let gregorianCalendar = Calendar(identifier: .gregorian)
        //tweetsを日付でフィルターかける
        let filtered = tweets.filter { $0.startDate > gregorianCalendar.date(from: DateComponents(year: year, month: month, day: 1))! }.filter { $0.startDate < gregorianCalendar.date(from:  DateComponents(year: year, month: month+1, day: 1))! }
        
        let complete = filtered.map { tweet in
            dateformatter.string(from: tweet.startDate)
        }
        
        //その月のTweetがあるかで判別してBoolの配列を作る
        for item in calendar {
            if let date = gregorianCalendar.date(from: DateComponents(year: year, month: month, day: item)), complete.contains(dateformatter.string(from: date)){
                boolArray.append(true)
            } else {
                boolArray.append(false)
            }
        }
        
        return boolArray
    }
}
