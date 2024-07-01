//
//  OnboardingData.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 23/06/2024.
//

import Foundation

public let onboardingJsonString = """
[
    {
        "imageName": "welcome",
        "title": "Добро пожаловать!",
        "description": "Наше приложение поможет вам улучшить качество сна вашего ребенка!"
    },
    {
        "imageName": "sleeping_baby",
        "title": "Сон",
        "description": "С функцией отслеживания сна вы легко сможете добавлять и управлять временем сна вашего ребенка, записывая начало и окончание каждого периода. Это поможет следить за режимом и качеством сна, анализировать данные и улучшать привычки сна малыша."
    },
    {
        "imageName": "statistics",
        "title": "Статистика",
        "description": "С функцией статистики сна вы сможете отслеживать и анализировать режимы сна ребенка, записывая данные. Делитесь этой статистикой с экспертами для профессиональных рекомендаций."
    },
    {
        "imageName": "artificial_intelligence",
        "title": "Консультация",
        "description": "С функцией консультации ИИ вы получите персонализированные рекомендации на основе статистики сна вашего ребенка. Используя алгоритмы OpenAI, приложение анализирует данные и предлагает решения для улучшения качества сна."
    }
]
"""

let onboardingData : [OnboardingPageModel] = [
    OnboardingPageModel(title: NSLocalizedString("Onboarding_Welcome_Title", comment: "welcome"), description: NSLocalizedString("Onboarding_Welcome_Subtitle", comment: "welcome"), imageName: "welcome"),
    OnboardingPageModel(title: NSLocalizedString("Onboarding_Sleep_Title", comment: "welcome"), description: NSLocalizedString("Onboarding_Sleep_Subtitle", comment: "sleeping"), imageName: "sleeping_baby"),
    OnboardingPageModel(title: NSLocalizedString("Onboarding_Statistics_Title", comment: "welcome"), description: NSLocalizedString("Onboarding_Statistics_Subtitle", comment: "statistics"), imageName: "statistics"),
    OnboardingPageModel(title: NSLocalizedString("Onboarding_Consultation_Title", comment: "welcome"), description: NSLocalizedString("Onboarding_Consultation_Subtitle", comment: "consultation"), imageName: "artificial_intelligence"),
    
]
