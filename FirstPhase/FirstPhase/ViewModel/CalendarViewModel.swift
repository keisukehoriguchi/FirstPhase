//
//  CalendarViewModel.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/12.
//

import Foundation

struct CalendarViewModel {
    
    private let calendarLogic = CalendarLogic()
    private let date = DateItems.ThisMonth.Request()
    var calendarArray: [Int] = []
    var monthCounter = 0
    
    mutating func setThisMonth() {
        monthCounter = 0
        calendarArray = calendarLogic.dateManager(year: date.year, month: date.month)
    }
    
    mutating func moveTheMonth() {
        let theDate = DateItems.MoveMonth.Request(monthCounter)
        calendarArray = calendarLogic.dateManager(year: theDate.year, month: theDate.month)
    }
    
    init() {
        setThisMonth()
    }
    
}
