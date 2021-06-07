//
//  OnePracticeView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/10.
//

import SwiftUI

struct OnePracticeView: View {
    
    @State var practice: Practice
    @State var tweetBool: Bool = false
    @State var isShowingAction: Bool = false
    @State var willUpdatePractice: Bool = false
    @EnvironmentObject var practiceViewModel: PracticeViewModel
    
    var body: some View {
        
        HStack {
            Button(action: {
                tweetBool.toggle()
            }) {
                HStack{
                    Spacer()
                    Image(systemName: "moon")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                    Spacer()
                    VStack{
                        Text(practice.name)
                            .font(.title)
                        Text(practice.practiceCategory.rawValue)
                    }
                    .padding(.vertical)
                    
                    Spacer()
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                    Spacer()
                }
                .padding(5)
                .background(Color(#colorLiteral(red: 0.9852560163, green: 0.9898150563, blue: 1, alpha: 1)))
                .cornerRadius(15)
                .shadow(radius: 5)
            }
            .sheet(isPresented: $tweetBool, content: {
                TweetPracticeView(practice: practice)
            })
            
            Button(action: {
                isShowingAction.toggle()
            }, label: {
                Text("Button")
            })
            .actionSheet(isPresented: $isShowingAction, content: {
                ActionSheet(title: Text("編集の操作を選んでください。"), message: Text("記録も同様に扱われます。"), buttons: [
                    .default(Text("編集をします"), action: {
                        willUpdatePractice.toggle()
                    }),
                    .destructive(Text("削除をします"), action: {
                        practiceViewModel.deletePractice(practice: practice)
                    }),
                    .cancel()
                ])
            })
            .sheet(isPresented: $willUpdatePractice, content: {
                CreatePracticeView(updatePractice: practice)
            })
        }
    }
}

struct OnePracticeView_Previews: PreviewProvider {
    
    static var previews: some View {
        OnePracticeView(practice: practice1)
    }
}
