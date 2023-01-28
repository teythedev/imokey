//
//  AudioServiceProtocol.swift
//  imokey
//
//  Created by Tugay on 10.01.2023.
//

import Foundation

protocol AudioServiceProtocol: AnyObject{
    var delegate: AudioServiceDelegate? { get set }
    
    func startRecording(fileName: String)
    func stopRecording()
    
    func playAudio(fileName: String)
    func stopAudio()
}
