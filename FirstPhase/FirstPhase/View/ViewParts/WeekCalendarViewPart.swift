//
//  WeekCalendarViewPart.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/13.
//

import SwiftUI

struct WeekCalendarViewPart: View {
    @State var sundayDay: Int
    @State var mondayDay: Int
    @State var tuesdayDay: Int
    @State var wednesdayDay: Int
    @State var thursdayDay: Int
    @State var fridayDay: Int
    @State var saturdayDay: Int
    
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 30) {
                Text(String(sundayDay))
                Text(String(mondayDay))
                Text(String(tuesdayDay))
                Text(String(wednesdayDay))
                Text(String(thursdayDay))
                Text(String(fridayDay))
                Text(String(saturdayDay))
            }
            .frame(width: geometry.size.width)
        }
    }
}

struct WeekCalendarViewPart_Previews: PreviewProvider {
    static var previews: some View {
        WeekCalendarViewPart(sundayDay: 1, mondayDay: 2, tuesdayDay: 3, wednesdayDay: 4, thursdayDay: 5, fridayDay: 6, saturdayDay: 7)
    }
}
