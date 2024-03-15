//
//  LandmarkDetail.swift
//  MacLandmarks
//
//  Created by Vladyslav Burdeniuk on 3/15/24.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    
    var landmark: Landmark
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                MapView(coordinate: landmark.locationCoordinate)
                    .frame(height: 300)


                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
                    destination.name = landmark.name
                    destination.openInMaps()
                }
                .padding()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 24) {
                    CircleImage(image: landmark.image.resizable())
                        .frame(width: 160, height: 160)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(landmark.name)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .bold()
                            
                            FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                                .buttonStyle(.plain)
                        }
                        
                        
                        VStack(alignment: .leading) {
                            Text(landmark.park)
                                .font(.subheadline)
                            
                            Text(landmark.state)
                                .font(.subheadline)
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    }
                }
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                
                Text(landmark.description)
            }
            .padding()
            .frame(maxWidth: 700)
            .offset(y: -50)
        }
        .navigationTitle(landmark.name)
    }
}

#Preview {
    let modelData = ModelData();
    let landmarks = modelData.landmarks
    
    return LandmarkDetail(landmark: landmarks[0])
        .environment(modelData)
        .frame(width: 850, height: 700)
}
