//
//  Utilities.swift
//  Kiliaro
//
//  Created by Milad on 9/20/1400 AP.
//

import UIKit
import Toast_Swift

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
    
    public static func ToastMessages(messages:[String], isInfo: Bool = false, duration:TimeInterval = ToastManager.shared.duration){
        
        let lastDuration = ToastManager.shared.duration
        ToastManager.shared.duration = duration
        
        var message:String = ""
        for msg in messages {
            message = message + msg + "\n"
        }
        message = message.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Utilities.UI {
            
            
            let myView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 32, height: 10))
            
            let greenColor = UIColor(red: 76/255.0, green: 175/255.0, blue: 80/255.0, alpha: 1)
            myView.backgroundColor = isInfo == true ? greenColor : .red
            myView.layer.shadowOffset = CGSize(width: 0, height: 3)
            myView.layer.shadowRadius = 4
            myView.layer.shadowOpacity = 0.25
            myView.layer.cornerRadius = 5
            
            let label = UILabel(frame: myView.frame)
            label.frame.size.width = myView.frame.width - 32
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            label.textColor = .white
            label.text = message
            label.numberOfLines = 10
            
            myView.addSubview(label)
            
            
            let height = label.sizeThatFits(CGSize(width: UIScreen.main.bounds.width - 64, height: 20)).height
            myView.frame = CGRect(x: 0, y: 0, width: myView.bounds.width, height: height + 16)
            label.frame.size.height = height
            label.center = myView.center
            
            
            var vc:UIViewController? = nil
            for scene in UIApplication.shared.connectedScenes {
                if scene.activationState == .foregroundActive {
                    vc = ((scene as? UIWindowScene)!.delegate as! UIWindowSceneDelegate).window!!.rootViewController
                    break
                }
            }
            ToastManager.shared.position = .top
            vc?.view.showToast(myView)
            ToastManager.shared.duration = lastDuration
        }
    }
}
