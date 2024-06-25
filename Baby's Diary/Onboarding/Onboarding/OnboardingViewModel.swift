//
//  OnboardingViewModel.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 25/06/2024.
//

import Foundation

class OnboardingViewModel {
    private(set) var pageViewModels: [OnboardingPageViewModel]
    var currentPageIndex: Int = 0

    init(model: OnboardingModel) {
        self.pageViewModels = model.pages.map { OnboardingPageViewModel(model: $0) }
    }

    func viewModel(at index: Int) -> OnboardingPageViewModel? {
        guard index >= 0 && index < pageViewModels.count else {
            return nil
        }
        return pageViewModels[index]
    }
    
    var isLastPage: Bool {
        return currentPageIndex == pageViewModels.count - 1
    }
    
    func goToNextPage() -> Int? {
        if currentPageIndex < pageViewModels.count - 1 {
            currentPageIndex += 1
            return currentPageIndex
        }
        return nil
    }
}
