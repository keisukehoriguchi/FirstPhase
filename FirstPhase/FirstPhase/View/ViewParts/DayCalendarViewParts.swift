//
//  DayCalendarViewPart.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/13.
//

import SwiftUI

struct DayCalendarViewParts: View {
    @Binding var day: Int
    @Binding var check: Bool
    
    var body: some View {
        ZStack{
            if day != 0 {
                Text(String(day))
                if check {
                    Image(systemName: "checkmark")
                        .resizable()
                        .foregroundColor(.blue)
                        .opacity(0.5)
                }
            } else {
                Text("")
            }
        }
    }
}

struct DayCalendarViewPart_Previews: PreviewProvider {
    @State static var aDay = 1
    @State static var aCheck = true
    
    static var previews: some View {
        DayCalendarViewParts(day: $aDay, check: $aCheck)
    }
}
