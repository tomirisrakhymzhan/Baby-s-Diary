//
//  OnboardingViewModel.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 25/06/2024.
//

import Foundation

class OnboardingViewModel {
    @Published private(set) var pageViewModels: [OnboardingPageViewModel] = []
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
    
    func fetchLocalizedOnboardingData(){
        self.pageViewModels = OnboardingModel(pages: onboardingData).pages.map { OnboardingPageViewModel(model: $0) }
    }

    
    func loadOnboardingData(){
        let currentLanguageCode = Locale.current.language.languageCode?.identifier ?? "en"

        DispatchQueue.global().async {
            let filename = "OnboardingData_\(currentLanguageCode)"

                if let fileURL = Bundle.main.url(forResource: filename, withExtension: "json") {
                    do {
                        let jsonData = try Data(contentsOf: fileURL)
                        
                        let decoder = JSONDecoder()
                        let onboardingPages = try decoder.decode([OnboardingPageModel].self, from: jsonData)
                        let onboardingModel = OnboardingModel(pages: onboardingPages)
                        self.pageViewModels = onboardingModel.pages.map { OnboardingPageViewModel(model: $0) }
                        
                    } catch let e{
                        print("Could not decode onboarding data:\(e.localizedDescription)")
                    }
                } else {
                    // File not found
                    print(NSError(domain: "File not found", code: 404, userInfo: nil))
                }
            
        }
        
        
    }
}
