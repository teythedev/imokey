//
//  StorageServiceProtocol.swift
//  imokey
//
//  Created by Tugay Emre Yucedag on 28.01.2023.
//

import Foundation

enum ContentType: String {
    case audio = "audio/m4a"
}

enum StoregaPath: String {
    case audios = "audios"
}

enum FileType: String {
    case m4a = "m4a"
}

protocol StorageServiceProtocol {
    
    func upload(path: String, dataURL: URL, contentType: ContentType)
    
    func download()
    
    func delete()
    
    func list()
    
}
