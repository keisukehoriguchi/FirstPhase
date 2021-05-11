//
//  ResultCalendarView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/11.
//

import SwiftUI

struct ResultCalendarViewPart: View {
    
    private let dayOfWeekLabel = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                HStack {
                    Text("Month")
                }
                HStack{
                    ForEach(dayOfWeekLabel, id: \.self) { day in
                        Text(day)
                    }
                }
                .frame(width: geometry.size.width)
                
                
            }
        }

    }
}

struct ResultCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        ResultCalendarViewPart()
    }
}
