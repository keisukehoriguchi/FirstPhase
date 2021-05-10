//
//  TweetsView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/10.
//

import SwiftUI

struct OneTweetView: View {
    var body: some View {
        
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                HStack{
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                    ///Practice
                    HStack{
                        Image(systemName: "paintpalette")
                            .resizable()
                            .frame(width: 40, height: 40, alignment: .center)
                        VStack{
                            Text("Practice1")
                                .font(.title)
                            Text("2.5 Hour")
                                .font(.title3)
                                .foregroundColor(.blue)
                        }
                    }
                    .frame(width: geometry.size.width*0.8)
                    .padding(.all, 5)
                    .background(Color(#colorLiteral(red: 0.9155651927, green: 0.9101226926, blue: 0.9197488427, alpha: 1)))
                    .cornerRadius(15)
                }
                
                Text("Note:")
                Text("aaaaaaaa")
                    .foregroundColor(.blue)
                
                HStack(alignment: .center){
                    Spacer()
                    Image(systemName: "bubble.left")
                    Text("1")
                    Spacer()
                    Image(systemName: "heart")
                    Text("1")
                    Spacer()
                }
                .padding(5)
                
            }
            .padding(.all, 10)
            .frame(width: geometry.size.width, alignment: .leading)
            .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
            .cornerRadius(15)
            .shadow(color: .gray, radius: 3, x: 5, y: 5)
        }
        
    }
}

struct TweetsView_Previews: PreviewProvider {
    static var previews: some View {
        OneTweetView()
    }
}
