//
//  PracticeLogicTests.swift
//  FirstPhaseTests
//
//  Created by Keisuke Horiguchi on 2021/05/22.
//

import XCTest
@testable import FirstPhase

final class PracticeLogicTests: XCTestCase {

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    func testAdd() throws {
        do {
            let practiceLogic = PracticeLogic()
            let newPractice = Practice(practiceId: <#T##UUID#>, name: <#T##String#>, practiceCategory: <#T##PracticeCategory#>, isPractice: <#T##Bool#>, needsReminder: <#T##Bool#>)
            practiceLogic.addPracticeToFirestore(practice: newPractice) { result in
                <#code#>
            }
        }
    }
    
    func testUpdate() throws {
        
    }
    
    func testFetch() throws {
        
    }
    
    func testDelete() throws {
        
    }

}
