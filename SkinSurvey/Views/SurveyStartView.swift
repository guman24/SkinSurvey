//
//  ContentView.swift
//  SkinSurvey
//
//  Created by Rajan Karki on 25/11/2024.
//

import SwiftUI

struct SurveyStartView: View {
    
    @StateObject private var routeManager = RouteManager()
    
    var body: some View {
        NavigationStack(path: $routeManager.routes) {
            ZStack(alignment: .center) {
                Image("skin-2")
                    .resizable()
                
                VStack {
                    Spacer(minLength: 350)
                    VStack(alignment: .leading, spacing: 16) {
                        Text("What's my \nskin type?")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.system(size: 40, weight: .bold))
                        Text("Take this short quiz to discover your skin type in no time!")
                            .font(.callout)
                            .foregroundColor(Color.black)
                            .shadow(color: Color.orange.opacity(0.8), radius: 10, x: 0, y: 2)
                            .lineLimit(nil)
                            .padding(.trailing, 30)
                        Spacer()
                        CustomButton(title: "Start", didTap: {
                            routeManager.push(to: .survey)
                        })
                        .padding(.bottom, 12)

                    }
                    .frame(maxWidth: .infinity)
                    .padding(24)
                    .background(.yellow)
                    .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 30, topTrailing: 20)))
                }
            }
            .navigationDestination(for: Route.self, destination: { $0 })
            .ignoresSafeArea()
        }
        .environmentObject(routeManager)
    }
}

#Preview {
    SurveyStartView()
}
