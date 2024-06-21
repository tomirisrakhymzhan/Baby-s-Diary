//
//  OnboardingViewModel.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 20/06/2024.
//
import Foundation
import Combine

import Foundation
import Combine

class OnboardingViewModel: ObservableObject {
    
    var currentPageIndex: Int = 0
    let pages: [OnboardingModel]

    init() {
        self.pages = [
            OnboardingModel(title: "Hey there", description: "Lorem ipsum lorem ipsum lorem ipsum", imageName: "onboarding1"),
            OnboardingModel(title: "Features", description: "Lorem ipsum lorem ipsum lorem ipsum", imageName: "onboarding2"),
            OnboardingModel(title: "Let's start!", description: "Lorem ipsum lorem ipsum lorem ipsum", imageName: "onboarding3")
        ]
    }
    
    var currentPageModel: OnboardingModel {
        return pages[currentPageIndex]
    }
    
    var totalPageCount: Int {
        return pages.count
    }
    
    func nextPage() {
        if currentPageIndex < totalPageCount - 1 {
            currentPageIndex += 1
        }
    }
    
    func previousPage() {
        if currentPageIndex > 0 {
            currentPageIndex -= 1
        }
    }
}
