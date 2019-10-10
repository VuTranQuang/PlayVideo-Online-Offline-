//
//  ViewController.swift
//  PlayVideoLocalDemo
//
//  Created by RTC-HN154 on 10/10/19.
//  Copyright © 2019 RTC-HN154. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    var playViewController = AVPlayerViewController()
    var playView = AVPlayer()
    
    var listAudio = ["lactroi", "1553595975720"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Sau khi video chạy hết tự động phát lại video
        NotificationCenter.default.addObserver(self, selector: #selector(playItemDidReachEnd(notification:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playView.currentItem)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @objc func playItemDidReachEnd(notification: Notification) {
      self.playView.pause()
        self.playView.currentItem?.seek(to: .zero, completionHandler: nil)
        self.playView.play()
    }
    
    @IBAction func playVideo(_ sender: UIButton) {
        guard let mp4String = Bundle.main.path(forResource: listAudio[0], ofType: "mp4")  else {
            print("video not found")
            return
        }
        let url = URL(fileURLWithPath: mp4String)
        playView =  AVPlayer(url: url)
        playViewController.player = playView

       

        
        self.present(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
    }
    
}

