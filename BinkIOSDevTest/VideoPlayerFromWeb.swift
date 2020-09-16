//
//  VideoPlayerFromWeb.swift
//  BinkIOSDevTest
//
//  Created by Henry Hudson on 16/09/2020.
//

import SwiftUI
import AVKit

// doesnt work correctly with youtube videos
struct VideoPlayerFromWeb: View {
    var body: some View {
//        VideoPlayer(player: AVPlayer(url:  URL(string: "https://www.youtube.com/watch?v=32GE1bfxRVo")!))
        VideoPlayer(player: AVPlayer(url:  URL(string: "https://www.youtube.com/watch?v=32GE1bfxRVo")!))
            .frame(width: 400, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct VideoPlayerFromWeb_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerFromWeb()
    }
}
