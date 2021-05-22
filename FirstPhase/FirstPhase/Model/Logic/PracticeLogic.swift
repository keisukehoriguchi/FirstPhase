//
//  PracticeLogic.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/16.
//

import Foundation
import EventKit

struct PracticeLogic{
    
    func addPracticeToFirestore(practice: Practice, _ handler: @escaping FirestoreResultHandler<[Practice]>) {
        //Practice返すのではなくデータベースにアクセスして、直接書き換えるみたいな役割にした方がいい。ViewModel部分で該当の部分を読み込むようにする。
        handler(.failure(.logic))
        handler(.failure(.network))
        let practices: [Practice] = []
        handler(.success(practices))
    }
    
    func deletePracticeFromFirestore(practice: Practice, _ handler: @escaping FirestoreResultHandler<[Practice]>) {
        //Firestoreへの保存での条件分岐
        handler(.failure(.logic))
        handler(.failure(.network))
        let practices: [Practice] = []
        handler(.success(practices))
        
    }
    
    func updatePracticeToFirestore(practice: Practice, _ handler: @escaping FirestoreResultHandler<[Practice]>) {
        //Firestoreへの保存での条件分岐
        handler(.failure(.logic))
        handler(.failure(.network))
        let practices: [Practice] = []
        handler(.success(practices))
    }
    
    func fetchPracticesFromFirestore( _ handler: @escaping FirestoreResultHandler<[Practice]>) {
        //Firestoreへの保存での条件分岐
        handler(.failure(.logic))
        handler(.failure(.network))
        let practices: [Practice] = []
        handler(.success(practices))
        
    }
    
}
