//
//  SurveyManager.swift
//  SkinSurvey
//
//  Created by Rajan Karki on 25/11/2024.
//

import Foundation

let surveyImages: [String] = [
    "complexion-skin",
    "pores-skin",
    "tone-skin",
    "skin-care"
]

let skinTypes: [(String, String)]  = [
    ("Normal skin","Simple serum"),
    ("Dry skin", "Hydrating serum"),
    ("Oily skin", "Booster serum"),
    ("Sensitive skin", "Soothing serum"),
]

class SurveyManager: ObservableObject {
    
    @Published var surveyList: [Survey] = []
    @Published var selectedSurvey: Survey
    
    init() {
        self.surveyList = surveySamples
        self.selectedSurvey = surveySamples[0]
    }
    
    var isCurrentSurveyAnswered: Bool {
        selectedSurvey.answer?.isEmpty == false
    }
    
    var hasPreviousSurvey: Bool {
        let currentIndex = surveyList.firstIndex(of: selectedSurvey)  ?? 0
        return currentIndex > 0
    }
    
    var hasNextSurvey: Bool {
        let currentIndex = surveyList.firstIndex(of: selectedSurvey)  ?? 0
        return currentIndex < surveyList.count - 1
    }
    
    func nextSurvey() {
        let index = surveyList.firstIndex(of: selectedSurvey) ?? 0
        let nextIndex = index.advanced(by: 1)
        selectedSurvey = surveyList[nextIndex]
    }
    
    func previousSurvey() {
        let index = surveyList.firstIndex(of: selectedSurvey) ?? 1
        let previousIndex = index.advanced(by: -1)
        selectedSurvey = surveyList[previousIndex]
    }
    
    func answerToSurvey(_ answer: String) {
        var currentSurvey = self.selectedSurvey
        currentSurvey.answer = answer
        let index = surveyList.firstIndex(of: selectedSurvey) ?? 0
        surveyList[index] = currentSurvey
        selectedSurvey = currentSurvey
    }
    
    func isThisOptionSelected(_ option: String) -> Bool {
        return selectedSurvey.answer == option
    }
    
}
