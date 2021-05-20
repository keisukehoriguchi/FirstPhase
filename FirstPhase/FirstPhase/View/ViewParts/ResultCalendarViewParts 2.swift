//
//  ResultCalendarView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/11.
//

import SwiftUI

struct ResultCalendarViewParts: View {
    
    private let dayOfWeekLabel = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    @State var calendarViewModel = CalendarViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                HStack {
                    Text("Month")
                }
                HStack {
                    ForEach(dayOfWeekLabel, id: \.self) { dayOfWeek in
                        Text(dayOfWeek)
                            .frame(width: geometry.size.width/8)
                    }
                }
                .frame(width: geometry.size.width)
                ForEach(0..<(calendarViewModel.calendarArray.count/7), id: \.self) { week in
                    WeekCalendarViewParts(sundayDay: calendarViewModel.calendarArray[7*week+0], mondayDay: calendarViewModel.calendarArray[7*week+1], tuesdayDay: calendarViewModel.calendarArray[7*week+2], wednesdayDay: calendarViewModel.calendarArray[7*week+3], thursdayDay: calendarViewModel.calendarArray[7*week+4], fridayDay: calendarViewModel.calendarArray[7*week+5], saturdayDay: calendarViewModel.calendarArray[7*week+6], check: true)
                    }
            }
        }
        
    }
}

struct ResultCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        ResultCalendarViewParts()
    }
}
