//
//  LandmarkDetail.swift
//  HansongSwiftUIStudy
//
//  Created by hansong on 10/26/20.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300.0)
            CircleImage(image: landmark.image)
                .padding(.bottom, -130.0)
                .offset(x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/-130.0/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                HStack(alignment: .top) {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
            .padding()
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .automatic)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkDetail(landmark: landmarkData[0])
                .preferredColorScheme(.dark)
            LandmarkDetail(landmark: landmarkData[1])
        }
    }
}
