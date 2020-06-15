//
//  LeaderboardVC.swift
//  Family Quest
//
//  Created by James Barlian on 10/06/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class LeaderboardVC: UIViewController {

    
    @IBOutlet weak var pOneLabel: UILabel!
    @IBOutlet weak var pOneLikes: UILabel!
    @IBOutlet weak var pOneDislikes: UILabel!
    
    @IBOutlet weak var pTwoLabel: UILabel!
    @IBOutlet weak var pTwoLikes: UILabel!
    @IBOutlet weak var pTwoDislikes: UILabel!
    
    @IBOutlet weak var pThreeLabel: UILabel!
    @IBOutlet weak var pThreeLikes: UILabel!
    @IBOutlet weak var pThreeDislikes: UILabel!
    
    @IBOutlet weak var pFourLabel: UILabel!
    @IBOutlet weak var pFourLikes: UILabel!
    @IBOutlet weak var pFourDislikes: UILabel!
    
//    var pOne:String = "James"
//    var totalLikes:Int = 0
//    var totalDislikes:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Player one leaderboard
        pOneLabel.text = GameData.names[0]
        pOneLikes.text = "\(GameData.likes[0])"
        pOneDislikes.text = "\(GameData.dislikes[0])"
        
        // Player two leaderboard
        pTwoLabel.text = GameData.names[1]
        pTwoLikes.text = "\(GameData.likes[1])"
        pTwoDislikes.text = "\(GameData.dislikes[1])"
        
        // Player three leaderboard
        pThreeLabel.text = GameData.names[2]
        pThreeLikes.text = "\(GameData.likes[2])"
        pThreeDislikes.text = "\(GameData.dislikes[2])"
        
        // Player four leaderboard
        pFourLabel.text = GameData.names[3]
        pFourLikes.text = "\(GameData.likes[3])"
        pFourDislikes.text = "\(GameData.dislikes[3])"
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func exitButton(_ sender: Any) {
        if let vc = UIStoryboard(name: "HomePage", bundle: nil).instantiateViewController(withIdentifier: "HomePageVC") as? HomePageVC
        {
            vc.modalPresentationStyle = .fullScreen
            //present(vc, animated: true, completion: nil)
            if let navigator = navigationController {
            navigator.pushViewController(vc, animated: true)
            }
        }
    }
    
}
