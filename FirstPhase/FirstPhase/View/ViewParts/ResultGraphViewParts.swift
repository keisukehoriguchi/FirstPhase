//
//  GraphViewPart.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/11.
//

import Foundation
import SwiftUI

struct ResultGraphViewParts: Shape {
    
    @State var doubleArray: [Double] = [
        0.3, 0.5, 0.8, 0.4, 0.6, 0.2, 0.9
    ]
    
    func path(in rect: CGRect) -> Path {
        let points = [
            //グラデーションレイヤー入れたいから始点と終点を0として設定しておく。
            CGPoint(x: rect.width * 0.05 , y: rect.height),
            CGPoint(x: rect.width * 0.1 , y: rect.height * CGFloat((1.0 - doubleArray[0]))),
            CGPoint(x: rect.width * 0.225 , y: rect.height * CGFloat((1.0 - doubleArray[1]))),
            CGPoint(x: rect.width * 0.35 , y: rect.height * CGFloat((1.0 - doubleArray[2]))),
            CGPoint(x: rect.width * 0.475 , y: rect.height * CGFloat((1.0 - doubleArray[3]))),
            CGPoint(x: rect.width * 0.6 , y: rect.height * CGFloat((1.0 - doubleArray[4]))),
            CGPoint(x: rect.width * 0.725 , y: rect.height * CGFloat((1.0 - doubleArray[5]))),
            CGPoint(x: rect.width * 0.85 , y: rect.height * CGFloat((1.0 - doubleArray[6]))),
            CGPoint(x: rect.width * 0.95 , y: rect.height)
            
        ]
        return Path { path in
            path.addLines(points)
        }
        
    }
    
}

struct ResultGraphViewPart_Previews: PreviewProvider {
    static var previews: some View {
        ResultGraphViewParts()
            .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom))
            .shadow(color: .gray, radius: 5, x: 2.0, y: -10)
    }
}
