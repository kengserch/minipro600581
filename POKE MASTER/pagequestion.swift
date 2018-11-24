//
//  pagequestion.swift
//  POKE MASTER
//
//  Created by kengserch on 10/11/2561 BE.
//  Copyright © 2561 ICTSUIM. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class pagequestion : UIViewController , AVAudioPlayerDelegate {
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var questionCounter: UILabel!
   
    @IBOutlet weak var point: UILabel!
    
    
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var imagePokemon: UIImageView!
    
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var OptionC: UIButton!
    
     var audioPlayer : AVAudioPlayer!
    let allQuestions = QuestionBank()
    var questionNumber: Int = 0
    var score : Int = 0
    var selectedAnswer: Int = 0
    
    let soundFilesName = ["right","wrong"]
    
    var timer = Timer()
    var timeCount = 10  //1 mins
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateQuestion()
        updateUI()
        // Do any additional setup after loading the view, typically from a nib.
        labelTime.text = String(timeCount)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(pagequestion.processTime),
                                     userInfo: nil, repeats: true)
    }
    @objc func processTime() {
        
        if timeCount > 0 {
            timeCount -= 1
            labelTime.text = String(timeCount)
        }else{
            timer.invalidate()
        }
        
        print(timeCount)
        labelTime.text = String(timeCount) //casting
        //"\(timeCount)"
    }
    
    
    @IBAction func ansButton(_ sender: UIButton) {
    
       
        if sender.tag == selectedAnswer {
            
            score += 2
            ProgressHUD.showSuccess (" ถูกต้องนะครับ ^^ ")
            playSound(soundFilesName[0])
            
        }else{
        
            ProgressHUD.showError (" ผิดนะครับ TT ")
            playSound(soundFilesName[1])
        }
        
        questionNumber += 1
        updateQuestion()
    
    }
    
    func updateQuestion(){
        
        if questionNumber <= allQuestions.list.count - 1{
            imagePokemon.image = UIImage(named:(allQuestions.list[questionNumber].questionImage))
            optionA.setTitle(allQuestions.list[questionNumber].optionA, for: UIControl.State.normal)
            optionB.setTitle(allQuestions.list[questionNumber].optionB, for: UIControl.State.normal)
            OptionC.setTitle(allQuestions.list[questionNumber].optionC, for: UIControl.State.normal)
            selectedAnswer = allQuestions.list[questionNumber].correctAnswer
            updateUI()
            
        }else {
            let alert = UIAlertController(title: "สุดยอดไปเลย", message: "คุณเล่นเกมตอบคำถามจบแล้ว อย่าลืมเอา point ไปแลกของรางวัลละ , กด  Restart เพื่อเล่นอีกรอบ ", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {action in self.restartQuiz()})
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    
    func updateUI(){
       timeCount = 10
        point.text = "Point: \(score)"
        questionCounter.text = "\(questionNumber + 1)/\(allQuestions.list.count)"
        progressView.frame.size.width = (view.frame.size.width/10) * CGFloat(questionNumber + 1)
        
    }
    
    func restartQuiz(){
       
        questionNumber = 0
        updateQuestion()
        timeCount = 10
        
    }
    
    
    func playSound(_ playThis : String)  {  // จะต่อตัวแปลเพิ่มใช้ในฟังชั่นนั้นได้ example : soundFilenameToplay playThis : String
    
    
    let soundURL = Bundle.main.url ( forResource: playThis , withExtension : "WAV")
    audioPlayer  = try! AVAudioPlayer(contentsOf: soundURL!)
    audioPlayer.play()
    
    }
    
    
    
    
    
    
}
