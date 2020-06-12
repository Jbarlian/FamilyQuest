//
//  LeaderboardVC.swift
//  Family Quest
//
//  Created by James Barlian on 10/06/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class LeaderboardVC: UIViewController {

    
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var dislikesLabel: UILabel!
    
    var pOne:String = "James"
    var totalLikes:Int = 0
    var totalDislikes:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        likesLabel.text = "\(totalLikes)"
        dislikesLabel.text = "\(totalDislikes)"
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

}
