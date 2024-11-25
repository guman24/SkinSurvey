//
//  SurveyResultView.swift
//  SkinSurvey
//
//  Created by Rajan Karki on 25/11/2024.
//

import SwiftUI

struct SurveyResultView: View {
    
    @EnvironmentObject private var routeManager: RouteManager
    
    var body: some View {
    
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                
                let skinType = skinTypes.randomElement()!
                
                Image("skin-result-1")
                    .resizable()
                    .frame(height: geometry.size.height)
                    .scaledToFit()
                VStack {
                    Spacer(minLength: geometry.size.height / 3)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("**\(skinType.0)**, lucky you! Caringfor normal skin is a breeze. Our **\(skinType.1)** is the ideal choice to keep your skin looking radiant and well-nourished.")
                            .font(.system(size: 30))
                            .lineSpacing(12)
                        Spacer()
                        CustomButton(title: "Start Again") {
                            routeManager.reset()
                        }
                        .padding(.bottom, 12)
                    }
                    .padding(24)
                    .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height * 2 / 3)
                    .background(.yellow)
                    .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 24, topTrailing: 24)))
                }
            }
        }
        .ignoresSafeArea()
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    SurveyResultView()
        .environmentObject(RouteManager())
}
