//
//  UserData.swift
//  HansongSwiftUIStudy
//
//  Created by hansong on 10/26/20.
//

import SwiftUI
import Combine

final class UserData:ObservableObject {
  @Published  var showFavoritesOnly = false
  @Published  var landmarks = landmarkData
    
}
