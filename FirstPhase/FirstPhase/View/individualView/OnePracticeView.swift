//
//  OnePracticeView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/10.
//

import SwiftUI

struct OnePracticeView: View {
    
    @State var practice: Practice
    
    var body: some View {
        HStack{
            Spacer()
            Image(systemName: "moon")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)
            Spacer()
            VStack{
                Text(practice.name)
                    .font(.title)
                Text(practice.practiceCategory.rawValue)
            }
            .padding(.vertical)
            
            Spacer()
            Image(systemName: "pencil")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)
            Spacer()
        }
        .padding(5)
        .background(Color(#colorLiteral(red: 0.9852560163, green: 0.9898150563, blue: 1, alpha: 1)))
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

struct OnePracticeView_Previews: PreviewProvider {
    static var previews: some View {
        OnePracticeView(practice: practice1)
    }
}
