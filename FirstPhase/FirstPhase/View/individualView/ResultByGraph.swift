//
//  ResultByGraph.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/11.
//

import SwiftUI

struct ResultByGraph: View {
    
    @EnvironmentObject var tweetViewModel: TweetViewModel
    
    var body: some View {
        ResultGraphViewParts(doubleArray: tweetViewModel.someoneGraphArray)
            .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom))
            .shadow(color: .gray, radius: 5, x: 2.0, y: -10)
    }
}

struct ResultByGraph_Previews: PreviewProvider {
    
    static var previews: some View {
        ResultByGraph().environmentObject(TweetViewModel())
    }
}
