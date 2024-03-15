//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Vladyslav Burdeniuk on 3/15/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
