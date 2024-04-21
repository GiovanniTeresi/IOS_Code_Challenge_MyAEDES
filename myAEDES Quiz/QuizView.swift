//
//  QuizView.swift
//  myAEDES Quiz
//
//  Created by Giovanni Teresi on 21/04/24.
//

import SwiftUI

struct QuizView: View {
    
    @Binding var viewActive:Int

    @State var punti = 0
    @State var domanda = 1
    @State var risposta1 = Color.white
    @State var risposta2 = Color.white
    @State var risposta3 = Color.white
    @State var risposta4 = Color.white
    @ObservedObject var quiz: Quiz
    @State var showAlert = false
    
    
    
    
    var body: some View {
        VStack {
            Text("Domanda: \(domanda)/\(quiz.domande.count), Punti: \(punti)")
                .foregroundStyle(.white)
                .padding(.bottom)
            //            ZStack {
            
            if ((quiz.domande[domanda-1].img) != nil){
                Text("Domanda: \(quiz.domande[domanda-1].testo)")
                    .foregroundStyle(.white)
                    .position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY * 0.3)
                    .padding()
                Image(quiz.domande[domanda-1].img!)
                    .padding()
            }
            else {
                Text("Domanda: \(quiz.domande[domanda-1].testo)")
                    .foregroundStyle(.white)
                    .position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY * 0.4)
                    .padding()
            }
            //            }
            
            Button(action:{
                if checkCorretto(risposta: quiz.domande[domanda-1].risposta1) {
                    risposta1 = Color.green
                    punti += 1
                    next()
                }
                else {
                    risposta1 = Color.red
                    showAlert = true
                }
            })
            {
                Text("\(quiz.domande[domanda-1].risposta1)")
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.04 )
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .background(risposta1)
                    .foregroundStyle(.black)
            }
            .alert("Risposta Errata", isPresented: $showAlert){
                Button("OK"){
                    next()
                }
            } message: {
                Text("La risposta corretta è: \(quiz.domande[domanda-1].rispostaCorretta)")
            }
            
            Button(action:{
                if checkCorretto(risposta: quiz.domande[domanda-1].risposta2) {
                    risposta2 = Color.green
                    punti += 1
                    next()
                }
                else {
                    risposta2 = Color.red
                    showAlert = true
                }
            })
            {
                Text("\(quiz.domande[domanda-1].risposta2)")
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.04 )
                    .padding()
                    .background(risposta2)
                    .foregroundStyle(.black)
            }
            .alert("Risposta Errata", isPresented: $showAlert){
                Button("OK"){
                    next()
                }
            } message: {
                Text("La risposta corretta è: \(quiz.domande[domanda-1].rispostaCorretta)")
            }
            
            Button(action:{
                if checkCorretto(risposta: quiz.domande[domanda-1].risposta3) {
                    risposta3 = Color.green
                    punti += 1
                    next()
                }
                else {
                    risposta3 = Color.red
                    showAlert = true
                }
            })
            {
                Text("\(quiz.domande[domanda-1].risposta3)")
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.04 )
                    .padding()
                    .background(risposta3)
                    .foregroundStyle(.black)
            }
            .alert("Risposta Errata", isPresented: $showAlert){
                Button("OK"){
                    next()
                }
            } message: {
                Text("La risposta corretta è: \(quiz.domande[domanda-1].rispostaCorretta)")
            }
            
            Button(action:{
                if checkCorretto(risposta: quiz.domande[domanda-1].risposta4) {
                    risposta4 = Color.green
                    punti += 1
                    next()
                }
                else {
                    risposta4 = Color.red
                    showAlert = true
                }
            })
            {
                Text("\(quiz.domande[domanda-1].risposta4)")
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.04 )
                    .padding()
                    .background(risposta4)
                    .foregroundStyle(.black)
            }
            .alert("Risposta Errata", isPresented: $showAlert){
                Button("OK"){
                    next()
                }
            } message: {
                Text("La risposta corretta è: \(quiz.domande[domanda-1].rispostaCorretta)")
            }
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 50/255, green: 79/255, blue: 112/255))
    }
    
    func checkCorretto(risposta: String) -> Bool{
        return risposta == quiz.domande[domanda-1].rispostaCorretta
    }
    
    func next() {
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false){_ in
            risposta1 = Color.white
            risposta2 = Color.white
            risposta3 = Color.white
            risposta4 = Color.white
            domanda += 1
            showAlert = false
            
            if (domanda > quiz.domande.count) {
                quiz.lastscore = punti
                
                isRecord()
                
                viewActive = 0
                domanda = 1
                punti = 0
            }
        }
    }
    
    func isRecord(){
        if (quiz.lastscore > quiz.highscore) {
            quiz.highscore = quiz.lastscore
            quiz.saveScore()
        }
    }

}


