//
//  APIHelper.swift
//  Kiliaro
//
//  Created by Milad on 9/20/1400 AP.
//

import Foundation

struct Pagination {
    let offset: Int
    let limit: Int
}
struct APIHelper {
    func makeGetRequest(uri: String = "", pagination: Pagination? = nil, tryCounter: Int? = nil, completionHandler: @escaping (Data) -> Void) {
        
        let parameters = self.makeParameters(param: pagination)
        let request = NSMutableURLRequest(url: URL(string: BaseUrl.getBaseUrl() + uri + parameters)!)
        request.httpMethod = "GET"
        
        
        var tryCount = 0
        if tryCounter != nil {
            tryCount = tryCounter!
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                //TODO: Log Error
                if tryCount < 3 {
                    tryCount += 1
                    self.makeGetRequest(tryCounter: tryCount, completionHandler: completionHandler)
                }else{
                    // Log Error
                    // show error
                    //                Utilities.UI {
                    //                    Utilities.ToastMessages(messages: [error?.localizedDescription ?? ""])
                    //                }
                    
                }
            } else {
                do{
                    // decode and show message
                    completionHandler(data!)
                }catch{
                    // log error
                }
                
            }
        })
        
        dataTask.resume()
    }
    
    func makeParameters(param: Pagination?) -> String {
        guard let param = param else {
            return ""
        }
        
        let paramString = "?offset=\(param.offset)&limit=\(param.limit)"
        return paramString
        
    }
}
