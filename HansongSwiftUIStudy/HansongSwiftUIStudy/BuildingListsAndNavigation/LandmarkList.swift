//
//  LandmarkList.swift
//  HansongSwiftUIStudy
//
//  Created by hansong on 10/26/20.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var userData:UserData
    
//    @State var showFavoritesOnly = true
    var body: some View {
        NavigationView {
           
            List() {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(userData.landmarks){ item in
                    if !self.userData.showFavoritesOnly || item.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: item)) {
                            LandmarkRow(landmark: item)
                        }
                    }
                }
                
            }
            .navigationTitle(Text("Landmarks"))
        }
       
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
//        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
//
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
    }
}
