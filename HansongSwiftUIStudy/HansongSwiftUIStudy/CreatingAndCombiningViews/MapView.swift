//
//  MapView.swift
//  HansongSwiftUIStudy
//
//  Created by hansong on 10/26/20.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
    func updateUIView(_ uiView: MKMapView, context: Context) {
//        let coordinate = CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
    func makeUIView(context:Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: landmarkData[0].locationCoordinate)
    }
}

struct LibraryContent :LibraryContentProvider {
    @LibraryContentBuilder
    var  views: [LibraryItem]{
        LibraryItem(
            MapView(coordinate: landmarkData[0].locationCoordinate),
            visible: true,
            title:"Map View",
            category:.control
        )
    }
    
}
