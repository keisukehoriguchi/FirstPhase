//
//  StoreReviewView.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/06/09.
//

import Foundation
import UIKit
import SwiftUI
import StoreKit

struct StoreReviewView: UIViewControllerRepresentable {
    typealias Callback = (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ error: Error?) -> Void
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<StoreReviewView>) -> UIViewController {
        let controller = UIViewController()
        
        return controller
    }
    
    func checkAndShowReview() {
        // If the count has not yet been stored, this will return 0
        var count = UserDefaults.standard.integer(forKey: UserDefaults.processCompletedCountKey)
        count += 1
        UserDefaults.standard.set(count, forKey: UserDefaults.processCompletedCountKey)
        
        // Get the current bundle version for the app
        let infoDictionaryKey = kCFBundleVersionKey as String
        guard let currentVersion = Bundle.main.object(forInfoDictionaryKey: infoDictionaryKey) as? String
        else { fatalError("Expected to find a bundle version in the info dictionary") }
        
        let lastVersionPromptedForReview = UserDefaults.standard.string(forKey: UserDefaults.lastVersionPromptedForReviewKey)
        
        // Has the process been completed several times and the user has not already been prompted for this version?
        if count%13 == 0 && currentVersion != lastVersionPromptedForReview {
            let twoSecondsFromNow = DispatchTime.now() + 2.0
            DispatchQueue.main.asyncAfter(deadline: twoSecondsFromNow) {
                if let windowScene = UIApplication.shared.windows.first?.windowScene {
                    SKStoreReviewController.requestReview(in: windowScene)
                }
                UserDefaults.standard.set(currentVersion, forKey: UserDefaults.lastVersionPromptedForReviewKey)
            }
        }
    }
    
    func showReview() {
        // Has the process been completed several times and the user has not already been prompted for this version?
        let twoSecondsFromNow = DispatchTime.now() + 2.0
        DispatchQueue.main.asyncAfter(deadline: twoSecondsFromNow) {
            if let windowScene = UIApplication.shared.windows.first?.windowScene {
                SKStoreReviewController.requestReview(in: windowScene)
            }
        }
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<StoreReviewView>) {
    }
}

extension UserDefaults {
    class var processCompletedCountKey: String {
        return "processCompletedCount"
    }
    
    class var lastVersionPromptedForReviewKey: String {
        return "lastVersionPromptedForReview"
    }
}
