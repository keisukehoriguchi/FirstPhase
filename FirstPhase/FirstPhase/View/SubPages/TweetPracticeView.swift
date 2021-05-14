//
//  TweetPracticeView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/13.
//

import SwiftUI

struct TweetPracticeView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var note: String = ""
    @State var startDate: Date = Date()
    @State var finishDate: Date = Date()
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("実践項目を選択")) {
                    Text("Practice1")
                    Text("Category")
                }
                
                Section(header: Text("情報を入力")) {
                    DatePicker("開始時間", selection: $startDate)
                    DatePicker("終了時間", selection: $finishDate)
                    HStack{
                        Spacer()
                        Text("実践時間:")
                        Text("40分")
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
                
                HStack(alignment: .center) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Cancel")
                    })
                    .frame(width: 100, height: 40, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 1)
                    )
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Text("Tweet")
                    })
                    .frame(width: 100, height: 40, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 1)
                    )
                }
                
            }
            .navigationTitle("実践を記録する")
        }
    }
}

struct TweetPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        TweetPracticeView()
    }
}
