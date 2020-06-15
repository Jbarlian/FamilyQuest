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
    var buttonClick:AVAudioPlayer!
    var index:Int!
//    var totalClicks:Int = 3
    
    var personToRate:String = GameData.selectedPlayer
//    var numberOfLikes:Int = 0
//    var numberOfDislikes:Int = 0
    
    @IBOutlet weak var rateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         // Do any additional setup after loading the view.
        
        index = GameData.names.firstIndex(of: GameData.selectedPlayer)!
        
        self.rateLabel.text = "for, \(GameData.names[index])"
       
        
        let sound = Bundle.main.path(forResource: "button-tick", ofType: "mp3")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }catch
        {
            print(error)
        }
        
        let click = Bundle.main.path(forResource: "button-click", ofType: "mp3")
        do{
            buttonClick = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: click!))
        }
        catch{
            print(error)
        }
    }
    
    @IBAction func dislikeButton(_ sender: Any) {
        if personToRate == GameData.names[index]{
            GameData.dislikes[index] += 1
        }
        print(GameData.dislikes[index])
        
        
        audioPlayer.play()
    }
    
    @IBAction func likeButton(_ sender: Any) {
        if personToRate == GameData.names[index]{
            GameData.likes[index] += 1
        }
        print(GameData.likes[index])
        
        
//        numberOfLikes += 1
//        print(numberOfLikes)
        audioPlayer.play()
    }
    
    @IBAction func doneButton(_ sender: Any) {
        buttonClick.play()
    }
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vc = segue.destination as! LeaderboardVC
//        vc.totalLikes = numberOfLikes
//        vc.totalDislikes = numberOfDislikes
//
//    }
}
