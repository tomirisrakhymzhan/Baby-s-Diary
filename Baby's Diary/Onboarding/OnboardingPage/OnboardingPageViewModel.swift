//
//  OnboardingViewModel.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 23/06/2024.
//

import Foundation

class OnboardingPageViewModel {
    var title: String {
        didSet { titleChanged?(title) }
    }
    var description: String {
        didSet { descriptionChanged?(description) }
    }
    var imageName: String {
        didSet { imageNameChanged?(imageName) }
    }

    var titleChanged: ((String) -> Void)?
    var descriptionChanged: ((String) -> Void)?
    var imageNameChanged: ((String) -> Void)?

    init(model: OnboardingPageModel) {
        self.title = model.title
        self.description = model.description
        self.imageName = model.imageName
    }

    func updateModel(with model: OnboardingPageModel) {
        self.title = model.title
        self.description = model.description
        self.imageName = model.imageName
    }
}

