//
//  OnboardingViewModel.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 23/06/2024.
//

import Foundation

class OnboardingPageViewModel: OnboardingPageViewData {
    var title: String
    var description: String
    var imageName: String
    
    init(model: OnboardingPageModel) {
        self.title = model.title
        self.description = model.description
        self.imageName = model.imageName
    }
    
    var titleText: String {
        return title
    }
    
    var descriptionText: String {
        return description
    }
    
    var image: String {
        return imageName
    }
}
