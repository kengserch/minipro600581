//
//  pagereward.swift
//  POKE MASTER
//
//  Created by kengserch on 10/11/2561 BE.
//  Copyright © 2561 ICTSUIM. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class pagereward : UIViewController,AVAudioPlayerDelegate {
    var audioPlayer : AVAudioPlayer!
    @IBOutlet weak var pointPageReward: UILabel!
    var point : Int = 600
     let soundFilesName = ["reward","wrong"]
    var reward1 : Int = 150
    var reward2 : Int = 100
    var reward3 : Int = 500
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pointPageReward.text = " Point : " + " \(point)"
    }
    
    
    @IBAction func rewardButton(_ sender: Any) {
    
        if (sender as AnyObject).tag == 1 && point >= reward1{
            
            point = point - reward1
            pointPageReward.text  =  "\(point)"
            ProgressHUD.showSuccess (" แลก ตุ๊กตา Pikachu สำเร็จ ><")
            playSound(soundFilesName[0])
            
        }
        else if  (sender as AnyObject).tag == 2 && point >= reward2 {
            point = point - reward2
            pointPageReward.text  =  "\(point)"
            ProgressHUD.showSuccess (" แลก ตุ๊กตา Evee สำเร็จ ><")
            playSound(soundFilesName[0])
            
        }
       else  if  (sender as AnyObject).tag == 3 && point >= reward3{
            
            point = point - reward3
            pointPageReward.text  =  "\(point)"
            ProgressHUD.showSuccess (" แลก กระเป๋า pokemon สำเร็จ ><")
            playSound(soundFilesName[0])
            
        }else{
            
            ProgressHUD.showError (" โปรดครวจสอบแต้มของคุณอาจจะไม่พอ TT ")
            playSound(soundFilesName[1])
        }
    }
    
    
    func playSound(_ playThis : String)  {  // จะต่อตัวแปลเพิ่มใช้ในฟังชั่นนั้นได้ example : soundFilenameToplay playThis : String
        
        
        let soundURL = Bundle.main.url ( forResource: playThis , withExtension : "WAV")
        audioPlayer  = try! AVAudioPlayer(contentsOf: soundURL!)
        audioPlayer.play()
        
    }
    
    
    
    
    
}
