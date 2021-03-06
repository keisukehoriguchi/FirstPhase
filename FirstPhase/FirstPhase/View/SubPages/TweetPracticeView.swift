//
//  TweetPracticeView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/13.
//

import SwiftUI

struct TweetPracticeView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var practice: Practice
    @State var note: String = ""
    @State var startDate: Date = Date()
    @State var finishDate: Date = Date()
    @State var updateTweet: Tweet?
    @State var changePickerStyle: Bool = false
    @EnvironmentObject var tweetViewModel: TweetViewModel
    
    var body: some View {
        VStack{
            
            NavigationView {
                Form {
                    Section(header: Text("実践項目を選択")) {
                        Text(practice.name)
                        Text(practice.practiceCategory.rawValue)
                    }
                    
                    Section(header: Text("情報を入力")) {
                        DatePicker("Start", selection: $startDate, displayedComponents: [.date, .hourAndMinute])
                        VStack(alignment: .leading){
                            if changePickerStyle {
                                DatePicker("End", selection: $finishDate)
                                .datePickerStyle(WheelDatePickerStyle())
                                Button(action: {
                                    changePickerStyle.toggle()
                                }, label: {
                                    Text("don't want to scroll")
                                })
                            } else {
                                DatePicker("End", selection: $finishDate)
                                Button(action: {
                                    changePickerStyle.toggle()
                                }, label: {
                                    Text("want to scroll")
                                })
                            }
                        }
                        HStack{
                            Spacer()
                            Text("実践時間:")
                            Text(Date().autoCalculate(start: startDate, finish: finishDate))
                            Spacer()
                        }
                        VStack(spacing: 0){
                            HStack{
                                Text("Note:")
                                Spacer()
                            }
                            .padding(0)
                            TextEditor(text: $note)
                                .lineLimit(10)
                        }
                    }
                    
                    //7DC08150-A829-406D-A76A-6DC6044A3C38
                    
                }
                .navigationTitle("実践を記録する")
            }
            
            HStack(alignment: .center) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                        .frame(width: 100, height: 40, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                })
                .padding()
                
                Spacer()
                
                if let tweet = updateTweet {
                    Button(action: {
                        tweetViewModel.updateTweet(tweet: tweet)
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Update")
                            .frame(width: 100, height: 40, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, lineWidth: 1)
                            )
                    })
                    .padding()
                } else {
                    Button(action: {
                        tweetViewModel.addTweet(user: tweetViewModel.userViewModel.user, practice: practice, startDate: startDate, finishDate: finishDate, note: note)
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Tweet")
                            .frame(width: 100, height: 40, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, lineWidth: 1)
                            )
                    })
                    .padding()
                }
            }
            .frame(height: 60, alignment: .center)
        }
        
    }
}

struct TweetPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TweetPracticeView(practice: practice1)
        }
    }
}
