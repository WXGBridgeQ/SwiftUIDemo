//
//  ContentView.swift
//  WWDC
//
//  Created by Screening Eagle MB4 on 27/6/20.
//

import SwiftUI

struct ContentView: View {
    let videos = Video.loadList()

    var body: some View {
        NavigationView {
            List(videos) { video in
                VideoCell(video: video)
            }
            .navigationBarTitle("All Sessions")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
