//
//  PracticeLogicTests.swift
//  FirstPhaseTests
//
//  Created by Keisuke Horiguchi on 2021/05/22.
//

import XCTest
@testable import FirstPhase

final class PracticeLogicTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
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
        let exp: XCTestExpectation = expectation(description: "wait for finish")
        let practiceLogic = PracticeLogic()
        let newPractice = Practice(practiceId: UUID(), name: "トレーニング", practiceCategory: PracticeCategory.appProgramCreation , isPractice: false, needsReminder: false)
        practiceLogic.addPracticeToFirestore(practice: newPractice) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
            case .success(let newPractices):
                XCTAssertEqual([newPractice], newPractices)
                exp.fulfill()
            }
        }
        wait(for: [exp], timeout: 5)
    }
    
    func testUpdate() throws {
        
    }
    
    func testFetch() throws {
        
    }
    
    func testDelete() throws {
        
    }
    
}
