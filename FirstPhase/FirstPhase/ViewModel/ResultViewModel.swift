//
//  ResultViewModel.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/06/09.
//

import Foundation
import SwiftUI

class ResultViewModel:ObservableObject {
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
    
    //リザルト用のロジック
    @Published var totalHour: String = ""
    @Published var someoneGraphArray: [Double] = [0.3, 0.5, 0.8, 0.4, 0.6, 0.2, 0.9]
    @Published var calendarCheck: [Bool] = []
    
    private let resultLogic = ResultLogic()
    
    init(source: [Tweet]) {
        setThisMonth()
        calendarCheck = resultLogic.checkBoolByCalender(year: date.year, month: date.month, tweets: source, calendar: calendarArray)
        totalHour = resultLogic.calculateByDayforTotalHour(source: source)
        someoneGraphArray = resultLogic.calculateByDayforGraphPoints(source: source)
    }
    
    func update(source: [Tweet]) {
        calendarCheck = resultLogic.checkBoolByCalender(year: date.year, month: date.month, tweets: source, calendar: calendarArray)
        totalHour = resultLogic.calculateByDayforTotalHour(source: source)
        someoneGraphArray = resultLogic.calculateByDayforGraphPoints(source: source)
    }

    //リザルト用のロジック
}
