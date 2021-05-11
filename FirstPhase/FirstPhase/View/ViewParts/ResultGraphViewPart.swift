//
//  GraphViewPart.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/11.
//

import Foundation
import SwiftUI

struct ResultGraphViewPart: Shape {
    
    func path(in rect: CGRect) -> Path {
        let points = [
            //グラデーションレイヤー入れたいから始点と終点を0として設定しておく。
            CGPoint(x: rect.width * 0.05 , y: rect.height * 0.5),
            CGPoint(x: rect.width * 0.1 , y: rect.height * 0.5 * (1.0 - 0.3)),
            CGPoint(x: rect.width * 0.225 , y: rect.height * 0.5 * (1.0 - 0.5)),
            CGPoint(x: rect.width * 0.35 , y: rect.height * 0.5 * (1.0 - 0.8)),
            CGPoint(x: rect.width * 0.475 , y: rect.height * 0.5 * (1.0 - 0.4)),
            CGPoint(x: rect.width * 0.6 , y: rect.height * 0.5 * (1.0 - 0.6)),
            CGPoint(x: rect.width * 0.725 , y: rect.height * 0.5 * (1.0 - 0.2)),
            CGPoint(x: rect.width * 0.85 , y: rect.height * 0.5 * (1.0 - 0.9)),
            CGPoint(x: rect.width * 0.9 , y: rect.height * 0.5)
            
        ]
        return Path { path in
            path.addLines(points)
        }
        
    }
    
}

struct ResultGraphViewPart_Previews: PreviewProvider {
    static var previews: some View {
        ResultGraphViewPart()
            .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .center))
            .shadow(color: .gray, radius: 5, x: 2.0, y: -10)
    }
}
