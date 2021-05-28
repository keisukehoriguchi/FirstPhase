import XCTest
@testable import FirstPhase
import FirebaseFirestore
import FirebaseFirestoreSwift

final class CommentLogicTest: XCTestCase {

    var commentLogic = CommentLogic()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        commentLogic.commentPath = "CommentTest"
        let db = Firestore.firestore()

        let documentRef = db.collection(commentLogic.commentPath).document(comment1.commentId.uuidString)
        do {
            try documentRef.setData(from: comment1)
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
        commentLogic.fetchCommentsFromFirestore { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
            case .success(let comments):
                XCTAssertEqual([comment1], comments)
                exp.fulfill()
            }
        }
        wait(for: [exp], timeout: 5)
    }

    func testAdd() throws {
        let exp: XCTestExpectation = expectation(description: "wait for finish")
        commentLogic.addCommentToFirestore(comment: comment2) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
            case .success(let comments):
                XCTAssertEqual([comment1, comment2], comments)
                exp.fulfill()
            }
        }
        wait(for: [exp], timeout: 5)
    }

    func testUpdate() throws {
        let exp: XCTestExpectation = expectation(description: "wait for finish")
        commentLogic.updateCommentToFirestore(comment: comment2_1) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
            case .success(let comments):
                XCTAssertEqual([comment1, comment2_1], comments)
                exp.fulfill()
            }
        }
        wait(for: [exp], timeout: 5)
    }

    func testDelete() throws {
        let exp: XCTestExpectation = expectation(description: "wait for finish")
        commentLogic.deleteCommentFromFirestore(comment: comment2_1) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
            case .success(let comments):
                XCTAssertEqual([comment1], comments)
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
