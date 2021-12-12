//
//  DBLayer.swift
//  Kiliaro
//
//  Created by Milad on 9/21/1400 AP.
//

import Foundation
import RealmSwift

class DBLayer: NSObject  {
    
    //public static let shared = DBLayer()
    let realm = try! Realm()
    
    func addObject(obj:Object) {
        try! realm.write {
            realm.add(obj)
        }
    }
    
    func updateObject(obj:Object) {
        try! self.realm.write {
            //realm.add(obj, update: true)
            self.realm.add(obj, update: .modified)
        }
    }
    
    func removeObject(obj:Object) {
        try! realm.write {
            realm.delete(obj)
        }
    }
    
    func getObjects(type: Object.Type) -> Results<Object> {
        
        let objs = realm.objects(type)
        return objs
    }
    
    func write(block: ()-> Void) {
        try! realm.write {
            block()
        }
    }
}

