//
//  startPageView.swift
//  Weeing
//
//  Created by 이승화 on 2023/09/01.
//

import SwiftUI

public struct startPageButton: View {
    var buttonText: String
    var buttonColor: Color
    
    init(
        buttonText: String,
        buttonColor: Color
    ) {
        self.buttonText = buttonText
        self.buttonColor = buttonColor
    }
    
    public var body: some View {
        Rectangle()
            .foregroundColor(buttonColor)
            .frame(height:40)
            .cornerRadius(10)
            .overlay(
                Text("\(buttonText)")
                    .foregroundColor(.white)
                    .font(.custom("AppleSDGothicNeoSB00", size: 15))
            )
            .padding(.horizontal,45)
    }
}
