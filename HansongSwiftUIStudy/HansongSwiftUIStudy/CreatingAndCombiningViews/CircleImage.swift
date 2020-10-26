//
//  CircleImage.swift
//  HansongSwiftUIStudy
//
//  Created by hansong on 10/26/20.
//

import SwiftUI

struct CircleImage: View {
    var image:Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white,lineWidth: 22))
            .shadow(radius:100)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}

struct LibraryContentCircleImage :LibraryContentProvider {
    @LibraryContentBuilder
    var  views: [LibraryItem]{
        LibraryItem(
            CircleImage(image: Image("turtlerock")),
            visible: true,
            title:"Circle Image",
            category:.control
        )
    }
    
}
