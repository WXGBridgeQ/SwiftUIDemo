//
//  Video.swift
//  WWDC
//
//  Created by Screening Eagle MB4 on 29/6/20.
//

import UIKit

struct Video: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let platforms: [Platform]
    let media: Media
    let imgURL: URL

    enum Platform: String, Codable {
        case iOS, macOS, tvOS, watchOS
    }

    struct Media: Codable {
        let hls: URL
        let duration: Int
    }

    var platformsText: String {
        platforms.map( { $0.rawValue }).joined(separator: ", ")
    }

    var durationText: String {
        let minutes = media.duration / 60
        let seconds = media.duration % 60
        return "\(minutes):\(String(format: "%02d", seconds))"
    }

    static func loadList() -> [Video] {
        guard let data = NSDataAsset(name: "videos")?.data,
              let list = try? JSONDecoder().decode([Video].self, from: data)
        else { return [] }
        return list
    }
}
