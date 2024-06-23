//
//  OnboardingViewModel.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 23/06/2024.
//

import Foundation
import Combine

class OnboardingPageViewModel: ObservableObject {
    // Published properties to notify observers when they change
    @Published var title: String
    @Published var description: String
    @Published var imageName: String
    
    private var cancellables = Set<AnyCancellable>()
    
    // Initializer to set initial data
    init(model: OnboardingPageModel) {
        self.title = model.title
        self.description = model.description
        self.imageName = model.imageName
    }
    
    // Method to update the model (useful if the model can change)
    func updateModel(with model: OnboardingPageModel) {
        self.title = model.title
        self.description = model.description
        self.imageName = model.imageName
    }

}
