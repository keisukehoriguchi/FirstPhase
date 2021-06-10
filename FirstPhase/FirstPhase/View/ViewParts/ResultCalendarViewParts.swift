//
//  ResultCalendarView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/11.
//

import SwiftUI

struct ResultCalendarViewParts: View {
    
    private let dayOfWeekLabel = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    @EnvironmentObject var resultViewModel:ResultViewModel
    
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
                ForEach(0..<(resultViewModel.calendarArray.count/7), id: \.self) { week in
                    WeekCalendarViewParts(sundayDay: resultViewModel.calendarArray[7*week+0], mondayDay: resultViewModel.calendarArray[7*week+1], tuesdayDay: resultViewModel.calendarArray[7*week+2], wednesdayDay: resultViewModel.calendarArray[7*week+3], thursdayDay: resultViewModel.calendarArray[7*week+4], fridayDay: resultViewModel.calendarArray[7*week+5], saturdayDay: resultViewModel.calendarArray[7*week+6], check: true)
                    }
            }
        }
        
    }
}

struct ResultCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        ResultCalendarViewParts().environmentObject(ResultViewModel(source: TweetViewModel().tweets))
    }
}
