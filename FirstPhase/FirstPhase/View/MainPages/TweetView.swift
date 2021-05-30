//
//  TweetView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/10.
//

import SwiftUI

struct TweetView: View {
    
    @EnvironmentObject var tweetViewModel: TweetViewModel
    
    var body: some View {
        ScrollView {
            VStack{
                ForEach(tweetViewModel.tweets.indices, id: \.self) { index in
                    OneTweetView(tweet: tweetViewModel.tweets[index])
                }
            }
        }
    }
}

struct TweetView_Previews: PreviewProvider {
    static var previews: some View {
        TweetView().environmentObject(TweetViewModel())
    }
}
