//
//  VideoDetail.swift
//  WWDC
//
//  Created by Screening Eagle MB4 on 29/6/20.
//

import SwiftUI
import AVKit

struct VideoDetail: View {
    let video: Video

    var body: some View {
        VStack(spacing: 0) {
            let player = AVPlayer(url: video.media.hls)

            VideoPlayer(player: player)
                .aspectRatio(4 / 3, contentMode: .fit)
                .onDisappear {
                    player.seek(to: .zero)
                    player.pause()
                }

            ScrollView {
                VStack(alignment: .leading) {
                    Text(video.title)
                        .font(.title)
                    Text(video.platformsText)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    Text(video.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.vertical, 8)
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
        }
        .navigationBarTitle(video.title, displayMode: .inline)
    }
}

struct VideoDetail_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetail(video: Video.loadList()[0])
    }
}
