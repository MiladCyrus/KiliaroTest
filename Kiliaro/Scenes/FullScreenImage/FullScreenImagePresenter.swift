//
//  FullScreenImagePresenter.swift
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

protocol FullScreenImagePresentationLogic
{
  func presentSomething(response: FullScreenImage.Something.Response)
}

class FullScreenImagePresenter: FullScreenImagePresentationLogic
{
  weak var viewController: FullScreenImageDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: FullScreenImage.Something.Response)
  {
    let viewModel = FullScreenImage.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
