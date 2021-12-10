//
//  MainInteractor.swift
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

protocol MainBusinessLogic
{
  func doSomething(request: Main.Something.Request)
}

protocol MainDataStore
{
  //var name: String { get set }
}

class MainInteractor: MainBusinessLogic, MainDataStore
{
  var presenter: MainPresentationLogic?
  var worker: MainWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Main.Something.Request)
  {
    worker = MainWorker()
    worker?.doSomeWork()
    
    let response = Main.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
