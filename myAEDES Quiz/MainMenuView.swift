//
//  MainMenuView.swift
//  myAEDES Quiz
//
//  Created by Giovanni Teresi on 21/04/24.
//

import SwiftUI

struct MainMenuView: View {
    
    @Binding var viewActive:Int
    @ObservedObject var quiz: Quiz
    
    var body: some View {
        VStack {
            Image("logo")
            Text("Highscore: \(quiz.highscore) punti")
                .foregroundStyle(.white)
                .dynamicTypeSize(.accessibility1)
                .padding(.bottom)
            Button("Start"){
                viewActive = 1
            }
            .background(.gray)
            .foregroundStyle(.white)
            .dynamicTypeSize(.accessibility1)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 50/255, green: 79/255, blue: 112/255))
    }
}
