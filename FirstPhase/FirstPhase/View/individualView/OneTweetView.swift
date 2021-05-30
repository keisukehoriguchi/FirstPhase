//
//  TweetsView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/10.
//

import SwiftUI

struct OneTweetView: View {
    
    @State var tweet: Tweet
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack{
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                ///Practice
                
                Spacer()
                HStack{
                    Image(systemName: "paintpalette")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                    VStack{
                        Text(tweet.practice.name)
                            .font(.title2)
                        Text(tweet.practice.practiceCategory.rawValue)
                            .font(.title3)
                        Text(tweet.duringTime)
                            .font(.title3)
                            .foregroundColor(.blue)
                    }
                }
                .padding(.all, 5)
                .background(Color(#colorLiteral(red: 0.934886694, green: 0.9293292165, blue: 0.9391586781, alpha: 1)))
                .cornerRadius(15)
                Spacer()
            }
            
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
        OneTweetView(tweet: tweet1)
    }
}
