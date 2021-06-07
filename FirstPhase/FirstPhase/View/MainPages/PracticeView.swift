//
//  PracticeView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/10.
//

import SwiftUI

struct PracticeView: View {
    @EnvironmentObject var practiceViewModel: PracticeViewModel
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                ForEach(practiceViewModel.practices) { practice in
                    OnePracticeView(practice: practice)
                }
            }
        }
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView().environmentObject(PracticeViewModel())
    }
}
