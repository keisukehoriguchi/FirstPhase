//
//  SettingOtherView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/10.
//

import SwiftUI

struct SettingOtherView: View {
    var body: some View {
        List {
            Section(header: Text("Setting")) {
                Label("Profile", systemImage: "")
                Label("Profile", systemImage: "")
            }
            
            Section(header: Text("Other")) {
                Label("Profile", systemImage: "")
                Label("Profile", systemImage: "")
            }
            
        }
    }
}

struct SettingOtherView_Previews: PreviewProvider {
    static var previews: some View {
        SettingOtherView()
    }
}
