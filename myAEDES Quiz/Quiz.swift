//
//  Quiz.swift
//  myAEDES Quiz
//
//  Created by Giovanni Teresi on 21/04/24.
//

import Foundation


class Quiz: ObservableObject {
    
    @Published var domande: [Domanda] = []
    @Published var highscore: Int = 0
    @Published var lastscore: Int = 0
    
    init() {
        
        var domanda = Domanda(
            testo: "Qual è la capitale d'Italia?",
            risposta1: "Roma",
            risposta2: "Milano",
            risposta3: "Firenze",
            risposta4: "Napoli",
            rispostaCorretta: "Roma")
        domande.append(domanda)
        domanda = Domanda(
            testo: "Cos'è questa?",
            img: "basketball",
            risposta1: "Palla da calcio",
            risposta2: "Palla da pallacanestro",
            risposta3: "Palla da golf",
            risposta4: "Palla da rugby",
            rispostaCorretta: "Palla da pallacanestro")
        domande.append(domanda)
        
        print(highscore)
        print("aaaaa")
//        retrieveScore()
        
    }
    
    func saveScore () {
        UserDefaults.standard.set(highscore, forKey: "highscore")
    }
    
    
    func retrieveScore() {
        highscore = UserDefaults.standard.integer(forKey: "highscore")
    }
    
    
}
