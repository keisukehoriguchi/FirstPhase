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
    @State var activePractices: [Practice] = [practice1, practice2]
    
    var body: some View {
        VStack(spacing: 20) {
            
            ForEach(activePractices.indices, id: \.self) { index in
                Button(action: {
                    self.isPresentedTweetPracticeView.toggle()
                }, label: {
                    OnePracticeView(practice: activePractices[index])
                })
                .sheet(isPresented: $isPresentedTweetPracticeView, content: {
                    TweetPracticeView()
                })
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
        PracticeView()
    }
}
