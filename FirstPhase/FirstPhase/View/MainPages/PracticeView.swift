//
//  PracticeView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/10.
//

import SwiftUI

struct PracticeView: View {
    
    @State var isPresentedTweetPracticeView: Bool = false
    @State var isPresentedCreatePracticeView: Bool = false
    @EnvironmentObject var practiceViewModel: PracticeViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(practiceViewModel.practices.indices, id: \.self) { index in
                
                Button(action: {
                    isPresentedTweetPracticeView.toggle()
                }) {
//                    OnePracticeView(practice: practiceViewModel.practices[index])
                    Text(practiceViewModel.practices[index].name)
                        .sheet(isPresented: $isPresentedTweetPracticeView, content: {
                            TweetPracticeView(practice: practiceViewModel.practices[index])
                        })
                }
                
            }
            
            Button(action: {
                self.isPresentedCreatePracticeView.toggle()
            }, label: {
                Label("Add Another Practice", systemImage: "plus")
                    .padding()
            })
            .sheet(isPresented: $isPresentedCreatePracticeView, content: {
                CreatePracticeView()
            })
        }
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView().environmentObject(PracticeViewModel())
    }
}
