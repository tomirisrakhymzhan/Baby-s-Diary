//
//  OnboardingViewModel.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 25/06/2024.
//

import Foundation

class OnboardingViewModel {
    private(set) var pageViewModels: [OnboardingPageViewModel] = []
    var currentPageIndex: Int = 0
    
    var numberOfPages: Int {
        return pageViewModels.count
    }
    
    var isLastPage: Bool {
        return currentPageIndex == numberOfPages - 1
    }
    
    func goToNextPage() -> Int? {
        guard currentPageIndex < numberOfPages - 1 else {
            return nil
        }
        currentPageIndex += 1
        return currentPageIndex
    }
    
    func fetchOnboardingData(completion: @escaping (Error?) -> Void) {
        DispatchQueue.global().async {
            do {
                let jsonData = onboardingJsonString.data(using: .utf8)!
                let decoder = JSONDecoder()
                let pageModels = try decoder.decode([OnboardingPageModel].self, from: jsonData)
                let onboardingModel = OnboardingModel(pages: pageModels)
                self.pageViewModels = onboardingModel.pages.map { OnboardingPageViewModel(model: $0) }
                DispatchQueue.main.async {
                    completion(nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(error)
                }
            }
        }
    }
}
