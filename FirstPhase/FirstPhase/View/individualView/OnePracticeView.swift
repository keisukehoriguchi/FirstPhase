//
//  OnePracticeView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/10.
//

import SwiftUI

struct OnePracticeView: View {
    var body: some View {
        
        GeometryReader{ geometry in
            HStack{
                Image(systemName: "moon")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.blue)
                VStack{
                    Text("Practice")
                        .font(.title)
                    Text("Category")
                }
                .padding()
                
                Image(systemName: "pencil")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.blue)
            }
            .padding(5)
            .frame(width: geometry.size.width)
            .background(Color(#colorLiteral(red: 0.9852560163, green: 0.9898150563, blue: 1, alpha: 1)))
            .cornerRadius(15)
            .shadow(radius: 5)
        }
        
    }
}

struct OnePracticeView_Previews: PreviewProvider {
    static var previews: some View {
        OnePracticeView()
    }
}
