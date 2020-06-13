//
//  RatingPageVC.swift
//  Family Quest
//
//  Created by James Barlian on 10/06/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit
import AVFoundation

class RatingPageVC: UIViewController {

    var audioPlayer:AVAudioPlayer!
    
    var personToRate:String = GameData.names[1]
//    var numberOfLikes:Int = 0
//    var numberOfDislikes:Int = 0
    
    @IBOutlet weak var rateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         // Do any additional setup after loading the view.
        self.rateLabel.text = "for, \(GameData.names[0])"
       
        
        let sound = Bundle.main.path(forResource: "button-tick", ofType: "mp3")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }catch
        {
            print(error)
        }
    }
    
    @IBAction func dislikeButton(_ sender: Any) {
        if personToRate == GameData.names[1]{
            GameData.dislikes[1] += 1
        }
        print(GameData.dislikes[1])
        
        
        audioPlayer.play()
    }
    
    @IBAction func likeButton(_ sender: Any) {
        if personToRate == GameData.names[1]{
            GameData.likes[1] += 1
        }
        print(GameData.likes[1])
        
        
//        numberOfLikes += 1
//        print(numberOfLikes)
        audioPlayer.play()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vc = segue.destination as! LeaderboardVC
//        vc.totalLikes = numberOfLikes
//        vc.totalDislikes = numberOfDislikes
//
//    }
}
