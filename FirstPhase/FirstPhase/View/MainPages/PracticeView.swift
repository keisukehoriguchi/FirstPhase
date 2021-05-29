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
        NavigationView {
            VStack(spacing: 20) {
                ForEach(practiceViewModel.practices.indices, id: \.self) { index in
                    
                    Button(action: {
                        practiceViewModel.practicesBoolForPracticeView[index].toggle()
                    }) {
                        OnePracticeView(practice: practiceViewModel.practices[index])
                    }
                    .sheet(isPresented: $practiceViewModel.practicesBoolForPracticeView[index], content: {
                        TweetPracticeView(practice: practiceViewModel.practices[index])
                    })
                    .gesture(DragGesture()
                                .onEnded({ value in
                                    if (abs(value.translation.width) < 20) { return }
                                    if value.translation.width > 20 {
                                        
                                    } else if value.translation.width < -20 {
                                        
                                    }
                                }))
                    //                NavigationLink(destination: TweetPracticeView(practice: practiceViewModel.practices[index])) {
                    //                    OnePracticeView(practice: practiceViewModel.practices[index])
                    //                }
                    
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
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView().environmentObject(PracticeViewModel())
    }
}
