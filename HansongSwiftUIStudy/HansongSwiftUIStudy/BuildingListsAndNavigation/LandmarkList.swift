//
//  LandmarkList.swift
//  HansongSwiftUIStudy
//
//  Created by hansong on 10/26/20.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarkData) { item in
                NavigationLink(destination:LandmarkDetail(landmark:item))
                {
                    LandmarkRow(landmark: item)
                }
            }
            .navigationTitle(Text("Landmarks"))
        }
       
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
//        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
    }
}
