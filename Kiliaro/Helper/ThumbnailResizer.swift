//
//  ThumbnailResizer.swift
//  Kiliaro
//
//  Created by Milad on 9/20/1400 AP.
//

import Foundation

enum ResizeMode: String {
    case boundingBox = "bb"
    case cropped = "crop"
    case minDimension = "md"
}
struct ImageResizer {
    let w: Int
    let h: Int
    let m: ResizeMode
}

class ThumbnailResizer {


    func makeParameters(param: ImageResizer?) -> String {
        guard let param = param else {
            return ""
        }
        let paramString = "?w=\(param.w)&h=\(param.h)&m=\(param.m.rawValue)"
        return paramString
    }
}
