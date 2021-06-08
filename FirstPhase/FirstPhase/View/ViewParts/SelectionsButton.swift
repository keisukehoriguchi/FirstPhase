//
//  SelectionsButton.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/06/08.
//

import SwiftUI

struct SelectionsButton: View {
    
    @State var items: [PracticeCategory] = PracticeCategory.allCases
    @State var selections: [PracticeCategory] = []
    
    var body: some View {
        List {
            ForEach(self.items, id: \.self) { item in
                
                MultipleSelectionRow(title: item.rawValue, isSelected: self.selections.contains(item)) {
                    if self.selections.contains(item) {
                        self.selections.removeAll(where: { $0.rawValue == item.rawValue })
                    }
                    else {
                        self.selections.append(item)
                    }
                }
                
            }
        }
    }
}

struct SelectionsButton_Previews: PreviewProvider {
    static var previews: some View {
        SelectionsButton()
    }
}
