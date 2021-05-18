//
//  UserViewModel.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/18.


import Foundation

class UserViewModel {
    
    private let userLogic = UserLogic()
    var user: User?
    var interestedUser: User?
    
    func addUser(userId: UUID) {
        userLogic.addUserToFirestore(userId: userId) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let newUser):
                self.user = newUser
            }
        }
    }
    
     func updateUser(user: User) {
        userLogic.updateUserToFirestore(user: user) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let updateUser):
                self.user = updateUser
            }
        }
    }
    
    func fetchUser(userId: UUID) {
        userLogic.fetchPracticesFromFirestore { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let user):
                self.user = user
            }
        }
    }
    
    func fetchInterestedUser(userId: UUID) {
        userLogic.fetchPracticesFromFirestore { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let user):
                self.interestedUser = user
            }
        }
    }
    
    
}
