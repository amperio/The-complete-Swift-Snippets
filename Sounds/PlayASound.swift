//
//  ViewController.swift
//  PianoApp
//
//  Created by Juan Navarro  on 5/14/19.
//  Copyright © 2019 Juan Navarro . All rights reserved.
//
import UIKit
import AVFoundation // AVAudioPlayer is part of the AVFoundation framework
class ViewController: UIViewController, AVAudioPlayerDelegate {
    var soundKey : AVAudioPlayer! // We must store the player as a property or other variable that won't get destroyed straight away, if it don't the sound will stop inmediately. So it is retained while the sound is playing.  "!" means unwrapping optionals variables
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func notePressed(_ sender: UIButton) {
        playSound(fileSound: soundArray[sender.tag - 1])
    }
    
    func playSound(fileSound : String) {
        let sounduRL = Bundle.main.url(forResource: fileSound, withExtension: "wav") //The sound file. Me retorna un objeto opcional "url(forResource:withExtension:)"
        // Bundle.main = The main bundle represents the bundle directory that contains the currently executing code.
        do{
            soundKey = try AVAudioPlayer(contentsOf: sounduRL!) //Inicializando el objeto AVAudioPlayer
            //try! soundKey = AVAudioPlayer(contentsOf: sounduRL!) // Si verdaderamente estoy seguro de que no me va ha generar ningun error, utilizo el signo "!" y ya no uso el bloque catch{}, lo elimino
        } catch {
            print(error)
        }
        soundKey.play()
    }
}

//Help : https://www.hackingwithswift.com/example-code/media/how-to-play-sounds-using-avaudioplayer
//       https://gist.github.com/cliff538/91b8f8bf818d836e1d9537081d02c580
