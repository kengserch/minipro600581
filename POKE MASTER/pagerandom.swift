//
//  pagerandom.swift
//  POKE MASTER
//
//  Created by kengserch on 10/11/2561 BE.
//  Copyright © 2561 ICTSUIM. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class pagerandom : UIViewController,AVAudioPlayerDelegate {
    
    @IBOutlet weak var imageCoin: UIImageView!
    @IBOutlet weak var pointPageRandom: UILabel!
    var audioPlayer : AVAudioPlayer!
    var point : Int = 0
    let soundFilesName = ["coin"]
    var randomCoinIndex : Int = 0
    var coinArray = ["1p", "2p", "5p", "10p"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func randomBtn(_ sender: Any) {
        
        playSound(soundFilesName[0])
        updateCoin()
        
    }
    
    func updateCoin()  {
        randomCoinIndex = Int(arc4random_uniform(4))
       
        if randomCoinIndex == 0 {
              point += 1
            print(point)
            pointPageRandom.text =  " Point : " + " \(point)"
             ProgressHUD.showSuccess (" คุณได้ 1 แต้ม ")
        }
       else if randomCoinIndex == 1 {
            point += 2
            print(point)
            pointPageRandom.text = " Point : " + " \(point)"
            ProgressHUD.showSuccess (" คุณได้ 2 แต้ม ")
        }
        else if randomCoinIndex == 2 {
            point += 5
            print(point)
            pointPageRandom.text = " Point : " + " \(point)"
            ProgressHUD.showSuccess (" คุณได้ 5 แต้ม ")
        }
        else if randomCoinIndex == 3 {
            point += 10
            print(point)
            pointPageRandom.text = " Point : " + " \(point)"
            ProgressHUD.showSuccess (" คุณได้ Jackpot 10 แต้ม ")
        }
       
        imageCoin.image = UIImage(named: coinArray[randomCoinIndex])
        
    }
    
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
           
            updateCoin()
      
        }
    }
    
    
    func playSound(_ playThis : String)  {  // จะต่อตัวแปลเพิ่มใช้ในฟังชั่นนั้นได้ example : soundFilenameToplay playThis : String
        
        
        let soundURL = Bundle.main.url ( forResource: playThis , withExtension : "WAV")
        audioPlayer  = try! AVAudioPlayer(contentsOf: soundURL!)
        audioPlayer.play()
        
    }
}
