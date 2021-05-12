//
//  ResultCalendarView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/11.
//

import SwiftUI

struct ResultCalendarViewPart: View {
    
    private let dayOfWeekLabel = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    @State var calendarViewModel = CalendarViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                HStack {
                    Text("Month")
                }
//                HStack {
//                    ForEach(dayOfWeekLabel, id: \.self) { dayOfWeek in
//                        Text(dayOfWeek)
//                    }
//                }
                .frame(width: geometry.size.width)
                ForEach(0..<(calendarViewModel.calendarArray.count/7), id: \.self) { week in
                        HStack{
                            Text(String(calendarViewModel.calendarArray[7*week+0]))
                            Text(String(calendarViewModel.calendarArray[7*week+1]))
                            Text(String(calendarViewModel.calendarArray[7*week+2]))
                            Text(String(calendarViewModel.calendarArray[7*week+3]))
                            
                            //Viewの数的に設定上限突破してるらしい。
                            Text(String(calendarViewModel.calendarArray[7*week+3]))
                        }
                    }
            }
        }
        
    }
}

struct ResultCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        ResultCalendarViewPart()
    }
}
