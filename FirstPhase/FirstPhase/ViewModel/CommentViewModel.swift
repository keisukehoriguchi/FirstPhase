//
//  CommentViewModel.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/20.
//

import Foundation

class CommentViewModel: ObservableObject {
        private let commentLogic = CommentLogic()
        private var comments: [Comment] = []

        func addTweet(title: String) {
            commentLogic.addCommentToFirestore(title: title) { result in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let newComment):
                    self.comments = newComment
                }
            }
        }

        func deletePractice(comment: Comment) {
            commentLogic.deleteCommentFromFirestore(comment: comment) { result in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let newComments):
                    self.comments = newComments
                }
            }
        }

        func updatePractice(comment: Comment) {
            commentLogic.updateCommentToFirestore(comment: comment) { result in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let newComments):
                    self.comments = newComments
                }
            }
        }
}
