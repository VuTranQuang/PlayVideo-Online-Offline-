//
//  PlayVideoOnline.swift
//  PlayVideoLocalDemo
//
//  Created by RTC-HN154 on 10/10/19.
//  Copyright © 2019 RTC-HN154. All rights reserved.
//

import UIKit
import AVKit
//import MediaPlayer

class PlayVideoOnline: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    func playVideo() {
        let url = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        let moviePlayer = AVPlayer(url: url!)
        let vc = AVPlayerViewController()
        vc.player = moviePlayer
        self.present(vc, animated: true) {
            vc.player?.play()
        }
        
    }

    @IBAction func onClickPlayVideo(_ sender: UIButton) {
         playVideo()
    }
    

}
