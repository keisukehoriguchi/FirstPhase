//
//  CreatePracticeView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/13.
//

import SwiftUI

struct CreatePracticeView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var practiceName: String = ""
    @State var categoryName: String = ""
    @State var reminderIsOn: Bool = false
    @State var reminderDate: Date = Date()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("実践項目を選択")) {
                    TextField("実践すること", text: $practiceName)
                    TextField("カテゴリー", text: $categoryName)
                }
                
                Section {
                        Toggle("リマインダーを設定する", isOn: $reminderIsOn)
                    DatePicker("Date", selection: $reminderDate, displayedComponents: .hourAndMinute)
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
                        Text("Add")
                    })
                    .frame(width: 100, height: 40, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 1)
                    )
                }
                
            }
            .navigationTitle("実践を登録する")
        }
    }
}

struct CreatePracticeView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePracticeView()
    }
}
