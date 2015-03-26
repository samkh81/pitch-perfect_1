//
//  playSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Samar Kadhi on 3/18/15.
//  Copyright (c) 2015 Qadhi. All rights reserved.
//

import UIKit
import AVFoundation


class playSoundsViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    var receivedAudio: RecordedAudio!
    var audioEngine: AVAudioEngine!
    var audioFile:AVAudioFile!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  
    @IBAction func playSlowAudio(sender: UIButton) {
        playAudioWithRate(0.5)

 }
   
    
    @IBAction func playFastAudio(sender: UIButton) {
        playAudioWithRate(2.0)
        
}

    
    @IBAction func chipmunkAudio(sender: UIButton) {
        playAudioWithVariablePitch(1000)
       }
    
    
    @IBAction func darthvaderAudio(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
        
        }
    
    func playAudioWithRate (rate: Float){
        
        resetAudio()

        audioPlayer.rate = rate
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
        
}
    
    func playAudioWithVariablePitch(pitch: Float){
        
        resetAudio()

        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
    }
    
    func resetAudio(){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
    }
    

    @IBAction func stopAudio(sender: UIButton) {
        resetAudio()

}
     /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
