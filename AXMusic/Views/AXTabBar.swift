//
//  AXTabBar.swift
//  AXMusic
//
//  Created by Ashwin Paudel on 2022-08-17.
//

import SwiftUI

enum AXTab: String, CaseIterable {
    case music
    case download
    case settings
}

struct AXTabBar: View {
    @Binding var selectedTab: AXTab
    
    var tabImages: [AXTab: String] = [.music: "music.note", .download: "arrow.down.circle", .settings: "globe"]
    
    var body: some View {
        VStack {
            HStack {
                ForEach(AXTab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: tabImages[tab]!)
                        .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == tab ? .red : .gray)
                        .font(.system(size: 22))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background(.thinMaterial)
            .cornerRadius(10)
        }
    }
}

struct AXTabBar_Previews: PreviewProvider {
    static var previews: some View {
        AXTabBar(selectedTab: .constant(.music))
    }
}
