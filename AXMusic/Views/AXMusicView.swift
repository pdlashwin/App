//
//  AXMusicView.swift
//  AXMusic
//
//  Created by Ashwin Paudel on 2022-08-17.
//

import SwiftUI

struct AXMusicView: View {
    private var songs: [AXSongElement] = AXSongElement.allSongElements
    private var albums: [AXAlbumElement] = AXAlbumElement.allAlbumElements
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(albums, id: \.name) { album in
                            
                            NavigationLink(destination: AXAlbumNavigationView(album: album)) {
                                AlbumView(album: album)
                                    .padding()
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                
                AXSongListView(songs: songs)
                    .padding()
            }
            .clipped()
        }
    }
}

struct AXMusicView_Previews: PreviewProvider {
    static var previews: some View {
        AXMusicView()
    }
}
