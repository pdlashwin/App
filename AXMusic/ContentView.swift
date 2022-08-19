//
//  ContentView.swift
//  AXMusic
//
//  Created by Ashwin Paudel on 2022-08-13.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State private var selectedTab: AXTab = .music
    @State private var showNowPlaying = true
    @State private var showSheet = false
    
    @State var audioPlayer: AVAudioPlayer!

    
    var views: [AXTab: any View] = [.music: AXMusicView(), .download: AXDownloadView()]
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                ForEach(AXTab.allCases, id: \.rawValue) { tab in
                    HStack {
                        switch tab {
                        case .music:
                            AXMusicView()
                        case .download:
                            AXDownloadView()
                        case .settings:
                            AXMusicView()
                        }
                    }
                    .tag(tab)
                }
            }
            
            VStack(spacing: 5) {
                if showNowPlaying {
                    AXNowPlayingMiniture()
                        .onTapGesture {
                            showSheet.toggle()
                        }
                        .sheet(isPresented: $showSheet) {
                            AXNowPlayingView()
                        }
                }
                
                AXTabBar(selectedTab: $selectedTab)
            }
            .padding()
        }
        .padding(.bottom, 0.0)
        .padding(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
