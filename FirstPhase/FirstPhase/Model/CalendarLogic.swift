//
//  CalendarLogic.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/11.
//

import Foundation

struct CalendarLogic {
    
    //閏年算出公式
    let isLeapYear = { (year: Int) in year % 400 == 0 || (year % 4 == 0 && year % 100 != 0) }
    //曜日の算出公式
    let zellerCongruence = { (year: Int, month: Int, day: Int) in (year + year/4 - year/100 + year/400 + (13 * month + 8)/5 + day) % 7 }
    
    //年と月の指定で[Int]型として月の日付を返す。先月と来月の日付は0として返している。
    func dateManager(year: Int, month: Int) -> [Int] {
        let firstDayOfWeek = dayOfWeek(year, month, 1) //月の初めが何曜日か算出
        let numberOfCells = numberOfWeeks(year, month) * 7 //その月が何週間あるか算出
        let days = numberOfDays(year, month) //その月が何日あるか算出
        let Array = alignmentOfDays(firstDayOfWeek, numberOfCells, days) //表示しやすいように[Int]型に整形
        return Array
    }
    
}

extension CalendarLogic {
    
    //曜日の確認公式
    private func dayOfWeek(_ year: Int, _ month: Int, _ day: Int) -> Int {
        var year = year
        var month = month
        if month == 1 || month == 2 {
            year -= 1
            month += 12
        }
        return zellerCongruence(year, month, day)
    }
    
    //その月が何週間か確認するーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー↓
    private func numberOfWeeks(_ year: Int, _ month: Int) -> Int {
        if conditionFourWeeks(year, month) {
            return 4
        } else if conditionSixWeeks(year, month) {
            return 6
        } else {
            return 5
        }
    }
    
    private func conditionFourWeeks(_ year: Int, _ month: Int) -> Bool {
        let firstDayOfWeek = dayOfWeek(year, month, 1)
        return !isLeapYear(year) && month == 2 && (firstDayOfWeek == 0)
    }
    
    private func conditionSixWeeks(_ year: Int, _ month: Int) -> Bool {
        let firstDayOfWeek = dayOfWeek(year, month, 1)
        let days = numberOfDays(year, month)
        return (firstDayOfWeek == 6 && days == 30) || (firstDayOfWeek >= 5 && days == 31)
    }
    //その月が何週間か確認するーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー↑
    
    //月毎の日数チェック
    private func numberOfDays(_ year: Int, _ month: Int) -> Int {
        var monthMaxDay = [1:31, 2:28, 3:31, 4:30, 5:31, 6:30, 7:31, 8:31, 9:30, 10:31, 11:30, 12:31]
        if month == 2, isLeapYear(year) {
            monthMaxDay.updateValue(29, forKey: 2)
        }
        return monthMaxDay[month]!
    }
    
    //表示しやすいように[Int]型に整形(表示しないのは0として設定)
    private func alignmentOfDays(_ firstDayOfWeek: Int, _ numberOfCells: Int, _ days: Int) -> [Int] {
        var daysArray: [Int] = []
        var dayCount = 0
        for i in 0 ... numberOfCells {
            let diff = i - firstDayOfWeek
            if diff < 0 || dayCount >= days {
                daysArray.append(0)
            } else {
                daysArray.append(diff + 1)
                dayCount += 1
            }
        }
        return daysArray
    }
    
}
