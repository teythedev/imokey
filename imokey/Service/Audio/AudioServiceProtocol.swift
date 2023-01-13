//
//  AudioServiceProtocol.swift
//  imokey
//
//  Created by Tugay on 10.01.2023.
//

import Foundation

protocol AudioServiceProtocol{

    
    func askForPermission(completion: @escaping (Bool) -> Void)
    
    func startRecording()
    func stopRecording()
    
    func playAudio()
    func stopAudio()
}
