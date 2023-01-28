//
//  NewMemoryViewModel.swift
//  imokey
//
//  Created by Tugay on 6.01.2023.
//

import Foundation
import CoreLocation
import FirebaseStorage

enum RecordOrStop {
    case Record, Stop
}
enum PlayOrStop {
    case Play, Stop
}

final class NewMemoryViewModel: NewMemoryViewModelProtocol {
    weak var delegate: NewMemoryViewModelDelegate?
    
    private let audioService: AudioServiceProtocol
    
    private let locationService: LocationServiceProtocol
    
    private var fileName: String?
    
    init( locationService: LocationServiceProtocol, audioService: AudioServiceProtocol) {
        self.locationService = locationService
        self.audioService = audioService
        locationService.delegate = self
        audioService.delegate = self
    }
    
    func requestLocation() {
        delegate?.handleViewModelOutput(.showLoading(true))
        locationService.requestLocation()
    }
    
    func saveMemory() {
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let audioReference = storageRef.child("audios")
        let xref = audioReference.child("Comolokko.comocmo")
       // let memAudioRef = storageRef.child("audios/comolokko.comoco")
        let data = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(fileName!+".m4a")
        
        let metadata = StorageMetadata()
        metadata.contentType = "audio/m4a"
        let uploadTask = xref.putFile(from: data, metadata: metadata) { metadata, error in
            guard let metadata = metadata else {
                // Uh-oh, an error occurred!
                return
            }
            // Metadata contains file metadata such as size, content-type.
            let size = metadata.size
            // You can also access to download URL after upload.
            xref.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    // Uh-oh, an error occurred!
                    return
                }
            }
            
        }
        
        
        let observer = uploadTask.observe(.progress) { snapshot in
            print(snapshot.progress?.completedUnitCount)
        }
        print("Memory Saved")
    }
    
    
    func record() {
        fileName = UUID().uuidString
        guard let fileName = fileName else { return }
        audioService.startRecording(fileName: fileName)
        delegate?.handleViewModelOutput(.changeRecordButton(.Stop))
        delegate?.handleViewModelOutput(.enablePlayButton(false))
    }
    
    func stopRecord() {
        audioService.stopRecording()
        delegate?.handleViewModelOutput(.changeRecordButton(.Record))
        delegate?.handleViewModelOutput(.enablePlayButton(true))
    }
    
    func playAudio() {
        audioService.playAudio(fileName: fileName!)
        delegate?.handleViewModelOutput(.changePlayButton(.Stop))
        delegate?.handleViewModelOutput(.enableRecordButton(false))
    }
    
    func stopAudio() {
        audioService.stopAudio()
        delegate?.handleViewModelOutput(.changePlayButton(.Play))
        delegate?.handleViewModelOutput(.enableRecordButton(true))
    }
}

extension NewMemoryViewModel: LocationServiceDelegate {
    func getLocation(result: (Result<CLLocationCoordinate2D, Error>)) {
        delegate?.handleViewModelOutput(.showLoading(false))
        switch result {
        case .success(let success):
            delegate?.handleViewModelOutput(.markTheMap(success))
        case .failure(let failure):
            delegate?.handleViewModelOutput(.showErrorAlert(failure.localizedDescription))
        }
    }
}

extension NewMemoryViewModel: AudioServiceDelegate {
    func audioStopped() {
        delegate?.handleViewModelOutput(.changePlayButton(.Play))
        delegate?.handleViewModelOutput(.enableRecordButton(true))
    }
    
    
}
