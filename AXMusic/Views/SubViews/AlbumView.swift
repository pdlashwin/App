//
//  AlbumView.swift
//  AXMusic
//
//  Created by Ashwin Paudel on 2022-08-18.
//

import SwiftUI

struct AlbumView: View {
    var album: AXAlbumElement
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.thinMaterial.shadow(.drop(radius: 7)))
                .frame(width: 190, height: 190)
            
            VStack {
                Image(systemName: album.art)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                
                Text(album.name)
                    .font(.title2)
            }
        }
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView(album: .init(name: "Albun", art: "circle.grid.3x3", songs: AXSongElement.allSongElements))
    }
}
