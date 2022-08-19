//
//  AXAlbumNavigationView.swift
//  AXMusic
//
//  Created by Ashwin Paudel on 2022-08-18.
//

import SwiftUI

struct AXAlbumNavigationView: View {
    var album: AXAlbumElement
    @EnvironmentObject var nowPlaying: AXNowPlaying
    
    var body: some View {
        VStack {
            Image(systemName: album.art)
                .resizable()
                .scaledToFit()
                .frame(width: 190, height: 190)
                .clipShape(Circle())
            Text(album.name)
                .font(.largeTitle)
                .bold()
            AXSongListView(songs: album.songs, currentAlbum: (true, album.name))
                .padding()
        }
    }
}

struct AXAlbumNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        AXAlbumNavigationView(album: AXAlbumElement.allAlbumElements[0])
    }
}
