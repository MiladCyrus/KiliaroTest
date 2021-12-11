//
//  Utilities.swift
//  Kiliaro
//
//  Created by Milad on 9/20/1400 AP.
//

import Foundation

class Utilities: NSObject {
    
    public static func BG(_ block: @escaping ()->Void) {
        DispatchQueue.global(qos: .default).async(execute: block)
    }
    
    public static func UI(_ block: @escaping ()->Void) {
        DispatchQueue.main.async(execute: block)
    }
    
}
