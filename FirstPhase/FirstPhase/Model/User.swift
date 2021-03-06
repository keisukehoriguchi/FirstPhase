//
//  User.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/18.
//

import Foundation

struct User: Codable, Equatable {
    let id: UUID
    var name: String
    var icon: String
    var profile: String
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
}
