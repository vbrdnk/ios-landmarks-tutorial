//
//  PageView.swift
//  Landmarks
//
//  Created by Vladyslav Burdeniuk on 3/14/24.
//

import SwiftUI

struct PageView<Page: View>: View {
    @State private var currentPage = 0
    var pages: [Page]


    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
        .aspectRatio(3 / 2, contentMode: .fit)
    }
}

#Preview {
    PageView(pages: ModelData().featured.map { FeaturedCard(landmark: $0)})
}
