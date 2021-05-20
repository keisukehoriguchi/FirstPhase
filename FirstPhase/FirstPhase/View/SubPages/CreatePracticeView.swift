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
    @State var category: PracticeCategory = .musicCreation
    @State var reminderIsOn: Bool = false
    @State var reminderDate: Date = Date()
    @State var showBlankAlert: Bool = false
    @EnvironmentObject var practiceViewModel: PracticeViewModel
    @State var updatePractice:Practice?
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("実践項目を選択")) {
                    TextField("実践すること", text: $practiceName)
                    Picker(selection: $category, label: Text("カテゴリー:"), content: {
                        ForEach(PracticeCategory.allCases, id: \.self) { (category) in
                            Text(category.rawValue).tag(category)
                        }
                    })
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
                    if let practice = updatePractice {
                        Button(action: {
                            if practiceName == "" {
                                showBlankAlert = true
                            } else {
                                //Practiceを登録する
                                practiceViewModel.updatePractice(practice: Practice(practiceId: practice.practiceId, name: practiceName, practiceCategory: category, isPractice: false, needsReminder: false))
                            }
                            
                        }, label: {
                            Text("Update")
                        })
                        .alert(isPresented: $showBlankAlert) {
                            Alert(title: Text("実践するものとカテゴリーを入力してください"), message: nil, dismissButton: .default(Text("了解")))
                        }
                        .frame(width: 100, height: 40, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                    } else {
                        Button(action: {
                            if practiceName == "" {
                                showBlankAlert = true
                            } else {
                                //Practiceを登録する
                                practiceViewModel.addPractice(title: practiceName, category: category)
                            }
                            
                        }, label: {
                            Text("Add")
                        })
                        .alert(isPresented: $showBlankAlert) {
                            Alert(title: Text("実践するものとカテゴリーを入力してください"), message: nil, dismissButton: .default(Text("了解")))
                        }
                        .frame(width: 100, height: 40, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                    }
                }
                
            }
            .navigationTitle("実践を登録する")
        }
    }
}

struct CreatePracticeView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePracticeView()
        CreatePracticeView()
    }
}
