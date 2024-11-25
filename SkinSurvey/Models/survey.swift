//
//  question.swift
//  SkinSurvey
//
//  Created by Rajan Karki on 25/11/2024.
//

import Foundation

struct Survey: Identifiable, Hashable, Equatable {
    var id = UUID()
    let question: String
    let options: [String]
    var answer: String?
    var image: String?
}


let surveySamples: [Survey] = [
    .init(question: "Take a quick look in the mirror: how's your complextion?", options: ["A bit dull", "Has a shiny appearance overall", "Shiny in a some spots, dull in others","Radiant and glowing!"], image: "complexion-skin"),
    .init(question: "Take a look at your pores: how would you rate them?", options: ["What pores?", "Fairly large", "Enlarged pores, especially in the T-zone", "Almost invisible"], image: "pores-skin"),
    .init(question: "How does your skin tone look in the morning", options: ["Oily & shiny", "Dry & flaky", "Normal and balanced", "Red & irritated"], image: "tone-skin"),
    .init(question: "How does your skin handle new skincare products", options: ["Gets irritated easily","Feels fine, no changes", "Some areas react, others don't", "Loves trying new things!"], image: "skin-care")
]
