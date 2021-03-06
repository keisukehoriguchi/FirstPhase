//
//  ResultByCalendar.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/11.
//

import SwiftUI

struct ResultByCalendar: View {
    
    var body: some View {
        ResultCalendarViewParts()
    }
}

struct ResultByCalendar_Previews: PreviewProvider {
    static var previews: some View {
        ResultByCalendar().environmentObject(TweetViewModel())
    }
}
