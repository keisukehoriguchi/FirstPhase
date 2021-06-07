//
//  Utilities.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/17.
//

import Foundation

typealias FirestoreResultHandler<T> = (Result<T, FirestoreResultError>) -> ()

enum FirestoreResultError: Error {
    case logic
    case network
    case other
}

struct Key {
    let countKey = "startUpCount"
    let userKey = "userId"
}
