//
//  AXMusicJSON.swift
//  AXMusic
//
//  Created by Ashwin Paudel on 2022-08-18.
//

import Foundation

struct AXAlbumElement: Codable {
    var name: String
    var art: String
    var songs: [AXSongElement]
    
    static let allAlbumElements: [AXAlbumElement] = Bundle.main.decode(file: "Albums.json")
}

// MARK: - Song
struct AXSongElement: Codable {
    var title: String
    var author: String
    var art: String
    var songPath: String
    
    static let allSongElements: [AXSongElement] = Bundle.main.decode(file: "Songs.json")
}


extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else { fatalError("Could not find \(file) in application!") }
        
        guard let data = try? Data(contentsOf: url) else { fatalError("\(file) cannot be loaded") }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else { fatalError("\(file) cannot be decoded") }
        
        return loadedData
    }
}
