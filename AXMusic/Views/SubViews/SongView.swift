//
//  SongView.swift
//  AXMusic
//
//  Created by Ashwin Paudel on 2022-08-18.
//

import SwiftUI

struct SongView: View {
    var song: AXSongElement
    
    var body: some View {
            HStack {
                VStack {
                    HStack {
                        Image(systemName: song.art)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        
                        VStack(alignment: .leading) {
                            Text(song.title)
                            Text(song.author)
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        Spacer()
                    }
                    .padding()
                }
            }
            .background(.thinMaterial)
            .cornerRadius(10)
    }
}

struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        SongView(song: .init(title: "Song", author: "Author", art: "star", songPath: "/test/test"))
    }
}
