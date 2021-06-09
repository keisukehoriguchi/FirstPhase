//
//  QuestionsAndOpinions.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/06/09.
//

import SwiftUI

struct QuestionsAndOpinions: View {
    var body: some View {
        WebView(request: URLRequest(url: URL(string: "https://forms.gle/j45z8vWaNAN8oF2g8")!))
    }
}

struct QuestionsAndOpinions_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsAndOpinions()
    }
}
