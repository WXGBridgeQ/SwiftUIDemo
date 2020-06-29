//
//  VideoCell.swift
//  WWDC
//
//  Created by Screening Eagle MB4 on 29/6/20.
//

import SwiftUI
import KingfisherSwiftUI

struct VideoCell: View {
    let video: Video

    var body: some View {
        VStack {
            KFImage(video.imgURL)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .overlay(durationOverlay, alignment: .bottomTrailing)

            NavigationLink(destination: VideoDetail(video: video)) {
                VStack(alignment: .leading) {
                    Text(video.title)
                        .font(.title)
                        .lineLimit(1)
                    Text(video.platformsText)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    Text(video.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                        .padding(.vertical, 8)
                }
            }
        }
    }

    var durationOverlay: some View {
        Text(video.durationText)
            .font(.subheadline)
            .foregroundColor(.white)
            .padding(.horizontal, 8)
            .padding(.vertical, 2)
            .background(Color.black.opacity(0.4))
            .clipShape(Capsule())
    }
}

struct VideoCell_Previews: PreviewProvider {
    static var previews: some View {
        VideoCell(video: Video.loadList()[0])
    }
}
