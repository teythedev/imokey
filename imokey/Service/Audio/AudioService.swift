//
//  AudioService.swift
//  imokey
//
//  Created by Tugay on 12.01.2023.
//

import Foundation
import AVFoundation

class AudioService: NSObject, AudioServiceProtocol {
    
    //var recordingSession: AVAudioSession = AVAudioSession.sharedInstance()
    var audioRecorder: AVAudioRecorder?
    var audioPlayer: AVAudioPlayer?
    
    var session: AVAudioSession?
    
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
                        // AVEncoderBitRateKey: 320000,
                        AVNumberOfChannelsKey: 1,
                        AVSampleRateKey: 12000
                    ]
                    
                    self.audioRecorder = try AVAudioRecorder(url: self.getDocumentsDirectory().appendingPathComponent(fileName), settings: recordSettings)
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
    
    //    func getPermission(completion: @escaping (Result<Bool,Error>) -> Void) {
    //        do {
    //            try recordingSession.setCategory(.playAndRecord, mode: .default)
    //            try recordingSession.setActive(true)
    //            recordingSession.requestRecordPermission { allowed in
    //                if allowed {
    //                    completion(.success(true))
    //                }else {
    //                    completion(.success(true))
    //                }
    //            }
    //        } catch {
    //            completion(.failure(error))
    //        }
    //    }
    
//    func setupRecording() {
//        guard let documentsDirectory = getDocumentsDirectory() else { return }
//        let audioFileName = UUID().uuidString + ".m4a"
//        let audioFileURL = documentsDirectory.appendingPathComponent(audioFileName)
//
//        let settings = [
//            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
//            AVSampleRateKey: 12000,
//            AVNumberOfChannelsKey: 1,
//            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
//        ]
//
//        do {
//            audioRecorder = try AVAudioRecorder(url: audioFileURL, settings: settings)
//            audioRecorder?.isMeteringEnabled = true
//            audioRecorder?.delegate = self
//            audioRecorder?.prepareToRecord()
//        }catch {
//            //TO DO
//        }
//    }
    
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
                recorder.pause()
            }
        }
    }
    
    func stopRecording() {
        if let recorder = audioRecorder {
            if recorder.isRecording {
                audioRecorder?.stop()
                do {
                    try recordingSession.setActive(false)
                }catch{
                    
                }
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
    
    func playAudio() {
        if let recorder = audioRecorder {
            if !recorder.isRecording {
                audioPlayer = try? AVAudioPlayer(contentsOf: recorder.url)
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
    //    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
    //        <#code#>
    //    }
}

extension AudioService: AVAudioPlayerDelegate {
    //    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
    //        <#code#>
    //    }
}
