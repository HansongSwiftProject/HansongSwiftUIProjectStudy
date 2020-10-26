//
//  CreatingAndCombiningViews.swift
//  HansongSwiftUIStudy
//
//  Created by hansong on 10/26/20.
//

import SwiftUI

struct CreatingAndCombiningViews: View {
    var body: some View {
        VStack{
            MapView(coordinate: landmarkData[0].locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height:301.0)
            
            CircleImage(image: Image("turtlerock"))
                .offset(x: 0, y: -130)
                .padding(.bottom,-130)
            
            VStack(alignment: .leading, spacing: nil, content: {
                Text("Turtle Rock")
                    .font(.title)
                HStack(alignment: .top, spacing: nil, content: {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                })
            })
            .padding()
            
            Spacer()
        }
    }
}

struct CreatingAndCombiningViews_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CreatingAndCombiningViews()
                .preferredColorScheme(.dark)
                
            CreatingAndCombiningViews()
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
                
        }
        
    }
}
