//
//  StorageService.swift
//  imokey
//
//  Created by Tugay Emre Yucedag on 28.01.2023.
//

import Foundation
import FirebaseStorage


final class StorageService: StorageServiceProtocol {
   
    private let storage: Storage!
    private let storageReference: StorageReference!
    
    init() {
        storage = Storage.storage()
        storageReference = storage.reference()
    }
    
    func upload(path: String, dataURL: URL, contentType: ContentType) {
//        let storage = Storage.storage()
//        let storageRef = storage.reference()
//        let audioReference = storageRef.child("audios")
        let reference = storageReference.child(path)
//        let data = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(fileName!+".m4a")
        
        let metadata = StorageMetadata()
        metadata.contentType = contentType.rawValue
        let uploadTask = reference.putFile(from: dataURL, metadata: metadata) { metadata, error in
            guard let metadata = metadata else {
                // Uh-oh, an error occurred!
                return
            }
            // Metadata contains file metadata such as size, content-type.
            let size = metadata.size
            // You can also access to download URL after upload.
            reference.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    // Uh-oh, an error occurred!
                    return
                }
            }
            
        }
        
        
        let observer = uploadTask.observe(.progress) { snapshot in
            print(snapshot.progress?.completedUnitCount)
        }
    }
    
    func download() {
        <#code#>
    }
    
    func delete() {
        <#code#>
    }
    
    func list() {
        <#code#>
    }
    
    
}
