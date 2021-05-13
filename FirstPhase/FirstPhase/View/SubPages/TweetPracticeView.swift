//
//  TweetPracticeView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/13.
//

import SwiftUI

struct TweetPracticeView: View {
    @State var note: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("実践項目を選択")) {
                Text("Practice1")
                Text("Category")
            }
            
            Section(header: Text("情報を入力")) {
                HStack {
                    Text("時間:")
                    Text("DatePicker?")
                }
                HStack{
                    TextField("Note:", text: $note)
                }
            }
        }
        .navigationTitle("実践を記録する")
    }
}

struct TweetPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        TweetPracticeView()
    }
}
