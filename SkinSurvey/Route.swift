//
//  Route.swift
//  SkinSurvey
//
//  Created by Rajan Karki on 25/11/2024.
//

import Foundation
import SwiftUI

enum Route: Hashable {
    case survey
    case readyResult
    case surveyResult
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case (.survey, .survey):
            return true
        case (.readyResult, .readyResult):
            return true
        case (.surveyResult, .surveyResult):
            return true
        default:
            return false
        }
    }
}


extension Route: View {
    public var body: some View {
        switch self {
        case .survey:
            SurveyView()
        case .readyResult:
            ReadyResultView()
        case .surveyResult:
            SurveyResultView()
        }
    }
}
