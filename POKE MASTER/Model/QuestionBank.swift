//
//  QuestionBank.swift
//  POKE MASTER
//
//  Created by kengserch on 16/11/2561 BE.
//  Copyright © 2561 ICTSUIM. All rights reserved.
//

import Foundation
class QuestionBank {
    
    var list = [Question] ()
    init() {
        //index = 0
        list.append(Question (image : "snorlax", questionText: "โปเกม่อนตัวนี้ชื่ออะไร", choiceA : "Snorlax" , choiceB : "Evee" , choiceC : "Bullbasor", answer: 1 ))
        //index = 1
        list.append(Question (image : "charmander", questionText: "โปเกม่อนตัวนี้ชื่ออะไร", choiceA : "Pidgey" , choiceB : "Chamander" , choiceC : "Pikachu", answer: 2 ))
        //index = 2
        list.append(Question (image : "bullbasaur", questionText: "โปเกม่อนตัวนี้ชื่ออะไร", choiceA : "Bullbasuar" , choiceB : "Evee" , choiceC : "jigglypuff", answer: 1 ))
        //index = 3
        list.append(Question (image : "jigglypuff", questionText: "โปเกม่อนตัวนี้ชื่ออะไร", choiceA : "Dratini" , choiceB : "Jigglypuff" , choiceC : "Psyduck", answer: 2 ))
        //index = 4
        list.append(Question (image : "psyduck", questionText: "โปเกม่อนตัวนี้ชื่ออะไร", choiceA : "Squirtle" , choiceB : "Evee" , choiceC : "Psyduck", answer: 3 ))
        //index = 5
        list.append(Question (image : "squirtle", questionText: "โปเกม่อนตัวนี้ชื่ออะไร", choiceA : "Squirtle" , choiceB : "Dratini" , choiceC : "Eevee", answer: 1 ))
        //index = 6
        list.append(Question (image : "eevee", questionText: "โปเกม่อนตัวนี้ชื่ออะไร", choiceA : "chamander" , choiceB : "Snorlax" , choiceC : "Evee", answer: 3 ))
        //index = 7
        list.append(Question (image : "meowth", questionText: "โปเกม่อนตัวนี้ชื่ออะไร", choiceA : "Psyduck" , choiceB : "meowth" , choiceC : "Bullbasor", answer: 2 ))
        //index = 8
        list.append(Question (image : "pidgey", questionText: "โปเกม่อนตัวนี้ชื่ออะไร", choiceA : "Pidgey" , choiceB : "Chamander" , choiceC : "Evee ", answer: 1 ))
        //index = 9
        list.append(Question (image : "dratini", questionText: "โปเกม่อนตัวนี้ชื่ออะไร", choiceA : "Psyduck" , choiceB : "Pickachu" , choiceC : "Dratini", answer: 3 ))
       
    }
}
