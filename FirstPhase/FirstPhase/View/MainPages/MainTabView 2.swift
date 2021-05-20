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
            
            TweetView().tabItem {
                VStack{
                    Image(systemName: "exclamationmark.bubble")
                    Text("Tweet")
                }
            }.tag(1)
            
            PracticeView().tabItem {
                VStack{
                    Image(systemName: "pencil.and.outline")
                    Text("Practice")
                }
            }.tag(2)
            
            ResultView().tabItem {
                VStack{
                    Image(systemName: "scroll")
                    Text("Result")
                }
            }.tag(3)
            
            SettingOtherView().tabItem {
                VStack{
                    Image(systemName: "gear")
                    Text("Setting")
                }
            }.tag(4)
            
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
