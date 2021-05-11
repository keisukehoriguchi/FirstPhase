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
        Path { path in
            path.addEllipse(in: CGRect(x: 0, y: 0, width: rect.width, height: rect.height))
            
        }
    }
    
}
