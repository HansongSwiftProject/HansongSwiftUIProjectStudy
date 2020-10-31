//
//  CategoryRow.swift
//  HansongSwiftUIStudy
//
//  Created by hansong on 10/27/20.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading,15)
                .padding(.top,5)
            
            ScrollView(.horizontal,showsIndicators:false){
                HStack(alignment: .top, spacing: 0, content: {
                    ForEach(self.items) {
                        landmark in
                        NavigationLink(
                            destination: LandmarkDetail(landmark: landmark)
                        ){
                            CategoryItem(landmark: landmark)
                        }
                    }
                })
            }
            .frame( height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: landmarkData[0].category.rawValue,
            items: Array(landmarkData.prefix(4))
        )
        .environmentObject(UserData())
    }
}


struct CategoryItem:View {
    var landmark:Landmark
    
    var body: some View {
        VStack(alignment: .leading, spacing: nil, content: {
            landmark.image
                .resizable()
                .renderingMode(.original)
                .frame(width: 155, height: 155, alignment: .center)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        })
        .padding(.leading,15)
    }
    
}
