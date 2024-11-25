//
//  SurveyResultView.swift
//  SkinSurvey
//
//  Created by Rajan Karki on 25/11/2024.
//

import SwiftUI

struct ReadyResultView: View {
    
    @EnvironmentObject private var routeManager: RouteManager
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Image("skin-result")
                    .resizable()
                    .frame(height: geometry.size.height)
                
                VStack {
                    Spacer(minLength: geometry.size.height / 3)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Ready to get your result?")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.trailing, 30)
                        
                        Text("Based on your answers, we've determined your skin type.")
                            .font(.system(size: 15, weight: .regular))
                            .shadow(color: .orange.opacity(0.3), radius: 10, x: 0, y: 3)
                        Spacer()
                        CustomButton(title: "Yes, tell me my skin type!") {
                            routeManager.push(to: .surveyResult)
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
        .environmentObject(routeManager)
    
    }
}

#Preview {
    ReadyResultView()
        .environmentObject(RouteManager())
}
