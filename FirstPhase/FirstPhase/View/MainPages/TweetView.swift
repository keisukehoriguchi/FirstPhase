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
        VStack{
            ForEach(tweetViewModel.tweets.indices, id: \.self) { index in
                OneTweetView(tweet: tweetViewModel.tweets[index])
                    .padding()
            }
        }
    }
}

//extension TweetView {
//    .onDelete(perform: rowRemove(offsets:))
//
//
//    func rowRemove(offsets: IndexSet) {
//        tweetViewModel.tweets.remove(atOffsets: offsets)
//    }
//}

struct TweetView_Previews: PreviewProvider {
    static var previews: some View {
        TweetView().environmentObject(TweetViewModel())
    }
}
