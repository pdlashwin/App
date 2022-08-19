//
//  MusicStructs.swift
//  AXMusic
//
//  Created by Ashwin Paudel on 2022-08-17.
//

import UIKit

struct Album: Hashable {
    var art: UIImage
    var name: String
}

struct Song: Hashable {
    var art: UIImage
    var name: String
    var author: String
}
