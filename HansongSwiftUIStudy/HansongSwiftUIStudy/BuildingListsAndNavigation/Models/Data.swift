//
//  Data.swift
//  HansongSwiftUIStudy
//
//  Created by hansong on 10/26/20.
//

import Foundation
import SwiftUI
import CoreLocation
import UIKit
//let landmarkData:[Landmark] =
//MARK: json 本地数据解析
func load<T:Decodable>(_ filename:String) ->T{
    var  data:Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    do {
      data = try Data(contentsOf: file)
    } catch  {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder =   JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch  {
        fatalError("Couldn't parse \(filename) as \(T.self) :\n\(error)")
    }
}
//MARK:本地资源图片加载
final class ImageStore{
    typealias _ImageDictionary = [String:CGImage]
    fileprivate var images:_ImageDictionary = [:]
    
    fileprivate static var scale = 2
//MARK:单例模式
    static var shared = ImageStore()
    
    func image(name:String) -> Image {
        let index = _guaranteeImage(name: name)
        return Image(images.values[index],scale: CGFloat(ImageStore.scale),label: Text(name))

    }
    
    static func loadImage(name:String) -> CGImage{
        
        guard  let url  = Bundle.main.url(forResource: name, withExtension: "jpg")
        else {
            fatalError("A Couldn't load image \(name).jpg from main bundle.")
        }
        
        guard let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil)
        else {
            fatalError("B Couldn't load image \(name).jpg from main bundle.")
        }
        
        guard  let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("C Couldn't load image \(name).jpg from main bundle.")
        }
        return image
    }
    
    fileprivate func _guaranteeImage(name:String) ->_ImageDictionary.Index{
        if let index = images.index(forKey: name) {
            return index
        }
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
}
