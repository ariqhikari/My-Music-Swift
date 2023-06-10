//
//  ViewController.swift
//  MyMusic
//
//  Created by Ariq Hikari on 05/06/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  @IBOutlet weak var playButton: UIButton!
  @IBOutlet weak var stopButton: UIButton!
  
  private var player: AVAudioPlayer?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // MARK: Memastikan bahwa url dari asset tidak null.
    guard let url = Bundle.main.url(forResource: "piano_sound", withExtension: "wav") else {
      return
    }
    
    do {
      try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
      player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
      
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    isPlaying(state: false)
  }

  @IBAction func playMusic(_ sender: Any) {
    guard let audioPlayer = player else { return }
    audioPlayer.play()
    isPlaying(state: true)
  }
  
  @IBAction func stopMusic(_ sender: Any) {
    guard let audioPlayer = player else { return }
    audioPlayer.stop()
    isPlaying(state: false)
  }
  
  private func isPlaying(state: Bool) {
    stopButton.isEnabled = state
    playButton.isEnabled = !state
  }
}

