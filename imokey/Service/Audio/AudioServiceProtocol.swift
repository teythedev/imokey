//
//  AudioServiceProtocol.swift
//  imokey
//
//  Created by Tugay on 10.01.2023.
//

import Foundation

protocol AudioServiceProtocol{
    func getPermission(completion: @escaping (Result<Bool,Error>) -> Void)
    
    func startRecording()
    
    func stopRecording()
    
    func playAudio()
    func stopAudio()
}
