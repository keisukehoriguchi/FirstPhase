//
//  ResultView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/10.
//

import SwiftUI

struct ResultView: View {
    var body: some View {
        VStack{
            ResultByGraph()
            ResultByCalendar()
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView().environmentObject(TweetViewModel())
    }
}
