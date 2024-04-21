//
//  ContentView.swift
//  myAEDES Quiz
//
//  Created by Giovanni Teresi on 21/04/24.
//

import SwiftUI




struct ContentView: View {
    
    
    @State var viewActive = 0
    @ObservedObject var quiz: Quiz
    
    init() {
        quiz = Quiz()
        quiz.retrieveScore()
//        quiz.saveFavs()
        print(quiz.highscore)
        
    }
    
    var body: some View {
        
        switch viewActive {
        case 0:
            MainMenuView(viewActive: $viewActive, quiz: quiz)
        case 1:
            QuizView(viewActive: $viewActive, quiz: quiz)
        default:
            Text("Nulla")
            
        }
        
    }
    

}

#Preview {
    ContentView()
}
