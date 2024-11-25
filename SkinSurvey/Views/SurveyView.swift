//
//  SurveyView.swift
//  SkinSurvey
//
//  Created by Rajan Karki on 25/11/2024.
//

import SwiftUI

struct SurveyView: View {

    @EnvironmentObject private var routeManager: RouteManager
    @StateObject private var surveyManager = SurveyManager()
    
    var body: some View {
        GeometryReader() { geometry in
            ZStack(alignment: .top) {
                Image(surveyManager.selectedSurvey.image ?? "skin-3")
                    .resizable()
                    .frame(height: geometry.size.height)
                    .aspectRatio(contentMode: .fit)
                VStack(spacing: 0) {
                    Spacer()
                        .frame(height: geometry.size.height / 3)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text(surveyManager.selectedSurvey.question)
                            .font(.system(size: 32, weight: .semibold))
                            .padding(.trailing, 40)
                            .padding(.vertical, 12)
                        ForEach(Array(surveyManager.selectedSurvey.options.enumerated()), id: \.element) { index, option in
                            HStack(alignment: .center) {
                                let isThisOptionSelected = surveyManager.isThisOptionSelected(option)
                                Text(index.alphabet)
                                    .font(.system(size: 15, weight: .medium))
                                    .frame(width: 28, height: 28, alignment: .center)
                                    .background(isThisOptionSelected ? .black : .black.opacity(0.1))
                                    .foregroundColor(isThisOptionSelected ? .white : .black)
                                    .overlay {
                                        if !isThisOptionSelected {
                                            RoundedRectangle(cornerRadius: 3)
                                                .stroke(.black, lineWidth: 0.5)
                                        }
                                    }
                                    .cornerRadius(3)
                                Text(option)
                                    .font(.system(size: 15, weight: .medium))
                                Spacer()
                            }
                            .padding(.vertical, 12)
                            .padding(.horizontal, 10)
                            .frame(maxWidth: .infinity)
                            .background(.black.opacity(0.1))
                            .overlay {
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(.black, lineWidth: 0.8)
                            }
                            .onTapGesture {
                                surveyManager.answerToSurvey(option)
                            }
                        }
                        Spacer()
                        HStack {
                            Button {
                                if surveyManager.hasPreviousSurvey {
                                    surveyManager.previousSurvey()
                                } else {
                                    routeManager.goBack()
                                }
                            } label: {
                                Image(systemName: "chevron.left")
                                    .fontWeight(.semibold)
                                    .padding(8)
                                    .frame(width: 45, height: 45)
                                    .background(.white)
                                    .clipped()
                                    .cornerRadius(6)
                                    .padding(.trailing, 12)
                                    .symbolVariant(.fill)
                                    .foregroundColor(.black)
                            }

                            CustomButton(title: "Ok") {
                                if surveyManager.isCurrentSurveyAnswered {
                                    if surveyManager.hasNextSurvey {
                                        surveyManager.nextSurvey()
                                    } else {
                                        routeManager.push(to: .readyResult)
                                    }
                                } else {
                                    print("answer first")
                                }
                            }
                        }
                        .padding(.bottom, 18)
                    }
                    .padding(24)
                    .frame(width: geometry.size.width, height: geometry.size.height * 2 / 3)
                    .background(.yellow)
                    .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 24, topTrailing: 24)))
                }
            
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .toolbar(.hidden, for: .navigationBar)
        .ignoresSafeArea()
        .environmentObject(routeManager)
    }
}

private extension Int {
    var alphabet: String {
        switch self {
        case 0:
            return "A"
        case 1:
            return "B"
        case 2:
            return "C"
        case 3:
            return "D"
        default:
            return "Z"
        }
    }
}

#Preview {
    SurveyView()
        .environmentObject(RouteManager())
}
