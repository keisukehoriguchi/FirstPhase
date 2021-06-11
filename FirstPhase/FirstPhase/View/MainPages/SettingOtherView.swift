//
//  SettingOtherView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/10.
//

import SwiftUI

struct SettingOtherView: View {
    
    @State var isShowAlert: Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(
                    destination: ProfileView(),
                    label: {
                        Label("Profile", systemImage: "person.crop.circle")
                    })
                
                List {
                    
                    Section(header: Text("Setting")) {
                        NavigationLink(
                            destination: QuestionsAndOpinions(),
                            label: {
                                Label("OpinionsAndQuestion", systemImage: "exclamationmark.bubble")
                            })
                        Button(action: {
                            StoreReviewView().showReview()
                        }, label: {
                            Label("Review", systemImage: "star.leadinghalf.fill")
                        })
                        .foregroundColor(.blue)
                        
                        Button(action: {
                            isShowAlert.toggle()
                        }, label: {
                            Label("Twitter of Developer", systemImage: "figure.wave")
                        })
                        .alert(isPresented: $isShowAlert, content: {
                            Alert(title: Text("作者のTwitterに飛びますか？"), message: Text("このアプリから離れます"), primaryButton: .default(Text("Leave"), action: {
                                let url = URL(string: "https://twitter.com/chigurik")
                                UIApplication.shared.open(url!)
                            }), secondaryButton: .cancel())
                        })
                        .foregroundColor(.blue)
                        
                    }
                    
                    Section(header: Text("Other")) {
                        Label("Profile", systemImage: "")
                        Label("Profile", systemImage: "")
                    }
                }
            }
        }
    }
}


struct SettingOtherView_Previews: PreviewProvider {
    static var previews: some View {
        SettingOtherView()
    }
}
