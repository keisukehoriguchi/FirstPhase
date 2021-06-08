//
//  MultipleSelectionRow.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/06/08.
//

import Foundation
import SwiftUI

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}
