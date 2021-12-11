//
//  MainWorker.swift
//  Kiliaro
//
//  Created by Milad on 9/19/1400 AP.
//  Copyright (c) 1400 AP ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class MainWorker
{

    func getSharedMedia(request: MainModel.SharedMediaModel.Request, completion: @escaping (MainModel.SharedMediaModel.Response) -> Void) {
        APIHelper().makeGetRequest(uri: RequestUrls().getSharedMedia, pagination: Pagination(offset: request.offset, limit: request.limit)) { response in
            do {
                let res = try JSONDecoder().decode([SharedMedia].self, from: response)
                let responseModel = MainModel.SharedMediaModel.Response(result: res)
                completion(responseModel)
            } catch  {
                print(error)
            }
        }
    }
}
