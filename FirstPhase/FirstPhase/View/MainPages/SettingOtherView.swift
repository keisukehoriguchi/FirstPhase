//
//  SettingOtherView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/10.
//

import SwiftUI

struct SettingOtherView: View {
    
    @State var isShowingProfile: Bool = false
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(
                    destination: ProfileView(),
                    isActive: $isShowingProfile,
                    label: {
                        Label("Profile", systemImage: "person.crop.circle")
                    })
                
                List {
                    
                    Section(header: Text("Setting")) {
                        Label("Profile", systemImage: "person.crop.circle")
                        Label("Profile", systemImage: "")
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
        SettingOtherView().environmentObject(UserViewModel())
    }
}
