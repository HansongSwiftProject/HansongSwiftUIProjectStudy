//
//  LandmarkRow.swift
//  HansongSwiftUIStudy
//
//  Created by hansong on 10/26/20.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark:Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
              
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
            
        }
        
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarkData[0])
                .preferredColorScheme(.dark)
            LandmarkRow(landmark: landmarkData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
struct LibraryContentLandmarkRow:LibraryContentProvider {
    @LibraryContentBuilder
    var  views: [LibraryItem]{
        LibraryItem(
            LandmarkRow(landmark: landmarkData[0]),
            visible: true,
            title:"Landmark Row",
            category:.control,
            matchingSignature: "qwq"
        )
    }
}

