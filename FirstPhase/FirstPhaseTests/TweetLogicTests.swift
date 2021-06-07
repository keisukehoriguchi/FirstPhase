//
//  TweetLogicTests.swift
//  FirstPhaseTests
//
//  Created by Keisuke Horiguchi on 2021/05/28.
//

import XCTest
@testable import FirstPhase
import FirebaseFirestore
import FirebaseFirestoreSwift

final class TweetLogicTests: XCTestCase {
    
    var tweetLogic = TweetLogic()


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        tweetLogic.tweetPath = "TweetTest"
        let db = Firestore.firestore()

        let documentRef = db.collection(tweetLogic.tweetPath).document(tweet1.id.uuidString)
        do {
            try documentRef.setData(from: tweet1)
        } catch {
            XCTFail()
        }
    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

    func testFetch() throws {
        let exp: XCTestExpectation = expectation(description: "wait for finish")
        tweetLogic.fetchTweetsFromFirestore { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
            case .success(let tweets):
                XCTAssertEqual([tweet1], tweets)
                exp.fulfill()
            }
        }
        wait(for: [exp], timeout: 5)
    }

    func testAdd() throws {
        let exp: XCTestExpectation = expectation(description: "wait for finish")
        tweetLogic.addTweetToFirestore(tweet: tweet2) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
            case .success(let tweets):
                XCTAssertEqual([tweet1, tweet2], tweets)
                exp.fulfill()
            }
        }
        wait(for: [exp], timeout: 5)
    }

    func testUpdate() throws {
        let exp: XCTestExpectation = expectation(description: "wait for finish")
        tweetLogic.updateTweetToFirestore(tweet: tweet2_1) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
            case .success(let tweets):
                XCTAssertEqual([tweet1, tweet2_1], tweets)
                exp.fulfill()
            }
        }
        wait(for: [exp], timeout: 5)
    }

    func testDelete() throws {
        let exp: XCTestExpectation = expectation(description: "wait for finish")
        tweetLogic.deleteTweetFromFirestore(tweet: tweet2_1) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
            case .success(let tweets):
                XCTAssertEqual([tweet1], tweets)
                exp.fulfill()
            }
        }
        wait(for: [exp], timeout: 5)
    }
}

//func testExample() throws {
//    // This is an example of a functional test case.
//    // Use XCTAssert and related functions to verify your tests produce the correct results.
//}
//
//func testPerformanceExample() throws {
//    // This is an example of a performance test case.
//    self.measure {
//        // Put the code you want to measure the time of here.
//    }
//}
