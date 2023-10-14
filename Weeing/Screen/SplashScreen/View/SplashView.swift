//
//  SplashView.swift
//  Weeing
//
//  Created by 이승화 on 2023/08/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.P30.ignoresSafeArea()
            Text("Weeing")
                .font(.custom("Nunito-Black", size: 45))
                .foregroundColor(.white)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
