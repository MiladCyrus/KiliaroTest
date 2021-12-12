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
    
    public static func RealmThread(_ block: @escaping ()->Void) {
        DispatchQueue(label: "RealmSwift").async(execute: block)
    }
    
    public static func bytesToMegabytes(bytes: Int) -> String {
        let kb = Double(bytes/1024)
        let mb = kb / 1024
        //let gb = mb / 1024
        
        return "\(String(format: "%.2f", mb)) MB"
    }
    
}
