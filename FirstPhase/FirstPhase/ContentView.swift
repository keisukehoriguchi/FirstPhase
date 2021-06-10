//
//  ContentView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/09.
//

import SwiftUI
import EventKit

struct ContentView: View {
    @StateObject var practiceViewModel = PracticeViewModel()
    @StateObject var tweetViewModel = TweetViewModel()
    @StateObject var commentViewModel = CommentViewModel()
    @StateObject var userViewModel = UserViewModel()
    @StateObject var resultViewModel = ResultViewModel(source: [])
    
    var body: some View {
        MainTabView()
            .environmentObject(practiceViewModel)
            .environmentObject(tweetViewModel)
            .environmentObject(commentViewModel)
            .environmentObject(userViewModel)
            .environmentObject(resultViewModel)
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
