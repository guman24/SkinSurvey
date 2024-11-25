//
//  CustomButton.swift
//  SkinSurvey
//
//  Created by Rajan Karki on 25/11/2024.
//

import SwiftUI

struct CustomButton: View {
    
    let title: String
    let didTap: () -> Void
    
    var body: some View {
        Button {
            didTap()
        } label: {
            HStack(alignment: .center) {
                Spacer()
                Text(title)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color.black)
                Spacer()
            }
            .frame(height: 45)
            .foregroundColor(.black)
            .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 3)
            .background(.white)
            .cornerRadius(8)
            .clipped()        
        }
    }
}

#Preview {
    CustomButton(title: "Start") {
        
    }
    .background(.yellow)
}
