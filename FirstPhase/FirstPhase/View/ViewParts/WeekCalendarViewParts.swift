//
//  WeekCalendarViewPart.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/13.
//

import SwiftUI

struct WeekCalendarViewParts: View {
    @State var sundayDay: Int
    @State var mondayDay: Int
    @State var tuesdayDay: Int
    @State var wednesdayDay: Int
    @State var thursdayDay: Int
    @State var fridayDay: Int
    @State var saturdayDay: Int
    @State var check: Bool
    
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                DayCalendarViewParts(day: $sundayDay, check: $check)
                    .frame(width: geometry.size.width/8, height: geometry.size.width/8)
                DayCalendarViewParts(day: $mondayDay, check: $check)
                    .frame(width: geometry.size.width/8, height: geometry.size.width/8)
                DayCalendarViewParts(day: $tuesdayDay, check: $check)
                    .frame(width: geometry.size.width/8, height: geometry.size.width/8)
                DayCalendarViewParts(day: $wednesdayDay, check: $check)
                    .frame(width: geometry.size.width/8, height: geometry.size.width/8)
                DayCalendarViewParts(day: $thursdayDay, check: $check)
                    .frame(width: geometry.size.width/8, height: geometry.size.width/8)
                DayCalendarViewParts(day: $fridayDay, check: $check)
                    .frame(width: geometry.size.width/8, height: geometry.size.width/8)
                DayCalendarViewParts(day: $saturdayDay, check: $check)
                    .frame(width: geometry.size.width/8, height: geometry.size.width/8)
            }
            .frame(width: geometry.size.width)
        }
    }
}

struct WeekCalendarViewPart_Previews: PreviewProvider {
    static var previews: some View {
        WeekCalendarViewParts(sundayDay: 1, mondayDay: 2, tuesdayDay: 3, wednesdayDay: 4, thursdayDay: 5, fridayDay: 6, saturdayDay: 7, check: true)
    }
}
