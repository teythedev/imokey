//
//  AudioService.swift
//  imokey
//
//  Created by Tugay on 12.01.2023.
//

import Foundation
import AVFoundation

final class AudioService: NSObject, AudioServiceProtocol {
 
    
    var delegate: AudioServiceDelegate?
    
    private var audioRecorder: AVAudioRecorder?
    private var audioPlayer: AVAudioPlayer?
    
    private var session: AVAudioSession?
    
    override init() {
        super.init()
    }
    
    func setupRecorder(fileName: String){
        session = AVAudioSession.sharedInstance()
        askForPermission { granted in
            if granted {
                do {
                    guard let session = self.session else {
                        return
                    }
                    try session.setMode(.default)
                    try session.setActive(true, options: .notifyOthersOnDeactivation)
                    try session.setCategory(.playAndRecord)
                    
                    let recordSettings : [String: Any] = [
                        AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                        AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue,
                        AVNumberOfChannelsKey: 1,
                        AVSampleRateKey: 12000
                    ]
                    
                    self.audioRecorder = try AVAudioRecorder(url: self.getDocumentsDirectory().appendingPathComponent(fileName+".m4a"), settings: recordSettings)
                    if let audioRecorder = self.audioRecorder {
                        audioRecorder.delegate = self
                        audioRecorder.prepareToRecord()
                    }
                } catch {
                    
                }
            }
        }
        
    }
    
    func askForPermission(completion: @escaping (Bool) -> Void) {
        guard let session = session else { return }
        switch session.recordPermission {
        case .undetermined:
            session.requestRecordPermission { granted in
                completion(granted)
            }
        case .granted:
            completion(true)
        default:
            print("Something happened")
            completion(false)
        }
    }
    
    func startRecording(fileName: String) {
        setupRecorder(fileName: fileName)
        
        if let player = audioPlayer {
            if player.isPlaying {
                player.stop()
            }
        }
        
        if let recorder = audioRecorder {
            if !recorder.isRecording {
                recorder.record()
            }else {
                recorder.stop()
            }
        }
    }
    
    func stopRecording() {
        if let recorder = audioRecorder {
            if recorder.isRecording {
                audioRecorder?.stop()
            }
        }
    }
    
    func stopAudio() {
        if let player = audioPlayer {
            if player.isPlaying {
                player.stop()
            }
        }
    }
    
    func playAudio(fileName: String) {
        
        do {
            try session?.overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
        } catch let error as NSError {
            print("audioSession error: \(error.localizedDescription)")
        }
        
        if let recorder = audioRecorder {
            if !recorder.isRecording {
                let url = self.getDocumentsDirectory().appendingPathComponent(fileName+".m4a")
                audioPlayer = try? AVAudioPlayer(contentsOf: url)
                audioPlayer?.delegate = self
                audioPlayer?.play()
            }
        }
    }
    
    
    func getDocumentsDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
}

extension AudioService: AVAudioRecorderDelegate {

}

extension AudioService: AVAudioPlayerDelegate {
        func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
            player.stop()
            guard let delegate = delegate else { return }
            delegate.audioStopped()
        }
}
