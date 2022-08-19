//
//  AXNowPlayingMiniture.swift
//  AXMusic
//
//  Created by Ashwin Paudel on 2022-08-18.
//

import SwiftUI

struct AXNowPlayingMiniture: View {
    @State var isPlaying = false
    @EnvironmentObject var nowPlaying: AXNowPlaying
    
    var body: some View {
        HStack(alignment: .center) {
            
            Spacer()
            
            VStack {
                HStack {
                    Image(systemName: nowPlaying.currentSong.art)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    
                    VStack(alignment: .leading) {
                        Text(nowPlaying.currentSong.title)
                        Text("\(nowPlaying.currentSong.author) \(nowPlaying.currentAlbum.0 ? "/ \(nowPlaying.currentAlbum.1!)" : "")")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    Spacer()
                    
                    // TODO: Add functionality
                    HStack {
                        Image(systemName: "chevron.left.2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        
                        Spacer(minLength: 5)
                        
                        Image(systemName: isPlaying ? "play.fill" : "pause.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .onTapGesture {
                                isPlaying.toggle()
                                // Other
                            }
                        
                        Spacer(minLength: 5)
                        
                        Image(systemName: "chevron.right.2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    .padding()
                    .frame(width: 170)
                }
            }
            .padding()
        }
        .frame(width: nil, height: 75)
        .background(.thinMaterial)
        .cornerRadius(10)
    }
}

struct AXNowPlayingMiniture_Previews: PreviewProvider {
    static var previews: some View {
        AXNowPlayingMiniture()
    }
}
