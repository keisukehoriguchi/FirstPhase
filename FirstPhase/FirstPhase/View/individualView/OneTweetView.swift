//
//  TweetsView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/10.
//

import SwiftUI

struct OneTweetView: View {
    
    @State var tweet: Tweet
    @State var willEditTweet: Bool = false
    @State var willDeleteTweet: Bool = false
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var tweetViewModel: TweetViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack{
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .top)
                Text(tweet.user.name)
                
                if tweet.user == userViewModel.user {
                    Spacer()
                    
                    Button(action: {
                        willEditTweet.toggle()
                    }, label: {
                        Text("Edit")
                    })
                    .foregroundColor(.blue)
                    .sheet(isPresented: $willEditTweet, content: {
                        TweetPracticeView(practice: tweet.practice, note: tweet.note, startDate: tweet.startDate, finishDate: tweet.finishDate, updateTweet: tweet)
                    })
                    
                    Button(action: {
                        willDeleteTweet.toggle()
                    }, label: {
                        Text("Delete")
                    })
                    .foregroundColor(.red)
                    .alert(isPresented: $willDeleteTweet, content: {
                        Alert(title: Text("このTweetを削除しますか？"), primaryButton: .destructive(Text("Delete"), action: {
                            tweetViewModel.deleteTweet(tweet: tweet)
                        }), secondaryButton: .cancel())
                    })
                }
            }
            
            HStack{
                Image(systemName: "paintpalette")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                Spacer()
                VStack(alignment: .leading){
                    Text(tweet.practice.name)
                        .font(.title2)
                    HStack{
                        Text(tweet.practice.practiceCategory.rawValue)
                        Text("/")
                        if tweet.practice.isPractice {
                            Text("実践")
                        } else {
                            Text("勉強")
                        }
                    }
                    .font(.title3)
                    
                    Text(tweet.duringTime)
                        .font(.title3)
                        .foregroundColor(.blue)
                }
                Spacer()
            }
            .padding(.all, 5)
            .background(Color(#colorLiteral(red: 0.934886694, green: 0.9293292165, blue: 0.9391586781, alpha: 1)))
            .cornerRadius(15)
            
            
            Text("Note:")
            Text(tweet.note)
                .foregroundColor(.blue)
            
            HStack(alignment: .center){
                Spacer()
                Image(systemName: "bubble.left")
                Text(String(tweet.comment.count))
                Spacer()
                Image(systemName: "heart")
                Text(String(tweet.prefer.count))
                Spacer()
            }
            .padding(5)
            
        }
        .padding(.all, 10)
        .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
        .cornerRadius(15)
        .shadow(color: .gray, radius: 3)
    }
    
}

struct TweetsView_Previews: PreviewProvider {
    static var previews: some View {
        OneTweetView(tweet: tweet1).environmentObject(UserViewModel()).environmentObject(TweetViewModel())
        
        OneTweetView(tweet: tweet2).environmentObject(UserViewModel()).environmentObject(TweetViewModel())
    }
}
