//
//  AXSongListView.swift
//  AXMusic
//
//  Created by Ashwin Paudel on 2022-08-18.
//

import SwiftUI

struct AXSongListView: View {
    var songs: [AXSongElement]
    @EnvironmentObject var nowPlaying: AXNowPlaying
    var currentAlbum: (Bool, String?) = (false, nil)

    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(songs, id: \.title) { song in
                    SongView(song: song)
                        .onTapGesture {
                            nowPlaying.currentSong = song
                            nowPlaying.currentAlbum = currentAlbum
                            print(song.title)
                            
//                            let player = AXPlayer(nowPlaying: nowPlaying)
//                            player.updateInfo()
                            nowPlaying.play()
                        }
                }
            }
        }
    }
}

struct AXSongListView_Previews: PreviewProvider {
    static var previews: some View {
        AXSongListView(songs: AXSongElement.allSongElements)
    }
}
