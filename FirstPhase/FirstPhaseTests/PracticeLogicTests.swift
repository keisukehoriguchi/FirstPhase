//
//  PracticeLogicTests.swift
//  FirstPhaseTests
//
//  Created by Keisuke Horiguchi on 2021/05/22.
//

import XCTest
@testable import FirstPhase
import FirebaseFirestore
import FirebaseFirestoreSwift

final class PracticeLogicTests: XCTestCase {
    
    var practiceLogic = PracticeLogic()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        practiceLogic.practicePath = "PracticeTest"
        let db = Firestore.firestore()

        let documentRef = db.collection(practiceLogic.practicePath).document(practice1.practiceId.uuidString)
        do {
            try documentRef.setData(from: practice1)
        } catch {
            XCTFail()
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetch() throws {
        let exp: XCTestExpectation = expectation(description: "wait for finish")
        practiceLogic.fetchPracticesFromFirestore { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
            case .success(let practices):
                XCTAssertEqual([practice1], practices)
                exp.fulfill()
            }
        }
        wait(for: [exp], timeout: 5)
    }
    
    func testAdd() throws {
        let exp: XCTestExpectation = expectation(description: "wait for finish")
        practiceLogic.addPracticeToFirestore(practice: practice2    ) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
            case .success(let practices):
                XCTAssertEqual([practice1, practice2], practices)
                exp.fulfill()
            }
        }
        wait(for: [exp], timeout: 5)
    }
    
    func testUpdate() throws {
        let exp: XCTestExpectation = expectation(description: "wait for finish")
        practiceLogic.updatePracticeToFirestore(practice: practice2_1) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
            case .success(let practices):
                XCTAssertEqual([practice1, practice2_1], practices)
                exp.fulfill()
            }
        }
        wait(for: [exp], timeout: 5)
    }
    
    func testDelete() throws {
        let exp: XCTestExpectation = expectation(description: "wait for finish")
        practiceLogic.deletePracticeFromFirestore(practice: practice2_1) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
            case .success(let practices):
                XCTAssertEqual([practice1], practices)
                exp.fulfill()
            }
        }
        wait(for: [exp], timeout: 5)
    }
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
