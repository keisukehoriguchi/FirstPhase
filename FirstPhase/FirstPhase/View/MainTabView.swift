//
//  MainTabView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/10.
//

import SwiftUI

struct MainTabView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            TweetView().tabItem { Image(systemName: "moon") }.tag(1)
            PracticeView().tabItem { Image(systemName: "moon") }.tag(2)
            ResultView().tabItem { Image(systemName: "moon") }.tag(3)
            SettingOtherView().tabItem { Image(systemName: "moon") }.tag(4)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
