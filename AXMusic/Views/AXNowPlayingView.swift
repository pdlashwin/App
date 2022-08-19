//
//  AXNowPlayingView.swift
//  AXMusic
//
//  Created by Ashwin Paudel on 2022-08-18.
//

import SwiftUI

struct AXNowPlayingView: View {
    @State var currentTime: Double = 50
    @State var isPlaying = false
    @EnvironmentObject var nowPlaying: AXNowPlaying

    var body: some View {
        VStack {
            
            Spacer()
            
            
            Group {
                Image(systemName: nowPlaying.currentSong.art)
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 5)
                    .frame(maxWidth: 250, maxHeight: 250)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.black, lineWidth: 2)
                    )
                
                Text(nowPlaying.currentSong.title)
                    .font(.largeTitle)
                
                Text("\(nowPlaying.currentSong.author) \(nowPlaying.currentAlbum.0 ? "/ \(nowPlaying.currentAlbum.1!)" : "")")
                    .font(.title2)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            // TODO: Add duration
            VStack {
                Slider(value: $currentTime, in: 0...100)
                    .padding()
                
                HStack {
                    Image(systemName: "chevron.left.2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    
                    Spacer()
                    
                    Image(systemName: isPlaying ? "play.fill" : "pause.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .onTapGesture {
                            isPlaying = !isPlaying
                            // Other
                        }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right.2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
                .padding()
                .frame(maxWidth: 300)
            }
            
            Spacer()
        }
    }
}

struct AXNowPlaying_Previews: PreviewProvider {
    static var previews: some View {
        AXNowPlayingView()
    }
}
