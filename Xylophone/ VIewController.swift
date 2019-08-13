//
//  ViewController.swift
//  Xylophone
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate{
   
    var audioPlayer: AVAudioPlayer?
    let soundArray = ["note1","note2","note3","note4","note5","note6","note7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        var selectedSoundFileName:String = soundArray[sender.tag - 1]
        
        playSound(selectedSoundFileName: selectedSoundFileName)
        
    }
    
    func playSound(selectedSoundFileName:String) {
        
        let soundURL = Bundle.main.url(forResource: selectedSoundFileName, withExtension: "wav")!
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL, fileTypeHint: AVFileType.wav.rawValue)
            
            guard let player = audioPlayer else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        
    }

}

