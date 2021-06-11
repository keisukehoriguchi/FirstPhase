//
//  ProfileView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/06/08.
//

import SwiftUI

struct ProfileView: View {
    
    @State var icon: String = ""
    @State var name: String = ""
    @State var profile: String = ""
    @State var follow: [UUID] = []
    @State var follower: [UUID] = []
    @State var generation: String = "20-30"
    @State var occupation: String = ""
    @State var target: [PracticeCategory] = []
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var tweetViewModel: TweetViewModel
    
    var body: some View {
        VStack {
            
            HStack {
                Image(icon)
                TextField("好きなニックネームを設定してください", text: $name)
            }
            HStack(spacing: 60) {
                Button(action: {
                    
                }, label: {
                    Text(String(follow.count))
                    Text("follow")
                })
                
                Button(action: {
                    
                }, label: {
                    Text(String(follower.count))
                    Text("follower")
                })
            }
            List {
                Section(header: Text("Setting")) {
                    HStack{
                        Text("職業:")
                            .foregroundColor(.gray)
                        TextField("", text: $occupation)
                    }
                    HStack{
                        Text("世代:")
                            .foregroundColor(.gray)
                        TextField("", text: $occupation)
                    }
                    VStack(alignment: .leading){
                        Text("目標:")
                            .foregroundColor(.gray)
                        SelectionsButton().frame(width: 300, height: 200, alignment: .center)
                    }
                    
                }
                
                Section(header:
                            Text("自己紹介")
                ) {
                    TextEditor(text: $profile)
                        .lineLimit(10)
                }
            }
            Button(action: {
                let updated = User(id: tweetViewModel.userViewModel.user.id, name: name, icon: icon, profile: profile)
                tweetViewModel.userViewModel.updateUser(user: updated)
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Update")
            })
            .padding()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(TweetViewModel())
    }
}
