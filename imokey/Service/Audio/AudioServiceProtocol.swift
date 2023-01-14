//
//  AudioServiceProtocol.swift
//  imokey
//
//  Created by Tugay on 10.01.2023.
//

import Foundation

protocol AudioServiceProtocol{

    

    
    func startRecording(fileName: String)
    func stopRecording()
    
    func playAudio()
    func stopAudio()
}
