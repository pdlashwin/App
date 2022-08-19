//
//  AXDownloadView.swift
//  AXMusic
//
//  Created by Ashwin Paudel on 2022-08-17.
//

import SwiftUI

struct AXDownloadView: View {
    @State private var youtubeURL = String()
    @State private var imageURL = String()
    
    @State private var showImage = false
    
    var body: some View {
        VStack {
            Text("Song Downloader")
                .font(.title)
            
            
            if showImage {
                AsyncImage(url: URL(string: imageURL)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .padding()
                .frame(maxWidth: 200, maxHeight: 200)
            } else {
                Image(systemName: "music.note")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 200, maxHeight: 200)
            }
            
            
            TextField("Enter YouTube Video URL", text: $youtubeURL)
                .padding()
                .textInputAutocapitalization(.never)
                .textContentType(.URL)
                .keyboardType(.URL)
            
            Button(action: {
                self.imageURL = "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/PNG_Test.png/953px-PNG_Test.png?20220525074127"
                showImage = true
            }) {
                Text("Download")
                    .frame(maxWidth: .infinity)
            }
            .padding()
            .buttonStyle(AXGrowingButton())
            

            Spacer()
        }
        .padding()
    }
}

struct AXDownloadView_Previews: PreviewProvider {
    static var previews: some View {
        AXDownloadView()
    }
}
