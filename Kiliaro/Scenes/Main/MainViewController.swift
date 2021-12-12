//
//  MainViewController.swift
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
import Hero

protocol MainDisplayLogic: class
{
    func displaySharedMedia(viewModel: MainModel.SharedMediaModel.ViewModel)
    func displayDataPassing()
}

class MainViewController: UIViewController, MainDisplayLogic
{
  var interactor: MainBusinessLogic?
  var router: (NSObjectProtocol & MainRoutingLogic & MainDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = MainInteractor()
    let presenter = MainPresenter()
    let router = MainRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
      
      // setup collection view layout
      let layout: UICollectionViewFlowLayout = self.collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
      layout.sectionInset = UIEdgeInsets(top: 0, left: spaceBeweenColumns, bottom: 0, right: spaceBeweenColumns)
      layout.minimumLineSpacing = spaceBeweenColumns

      addRefreshControl()
      getSharedMedia()
  }
  
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // invalidate hero ID in back transition
        let cells = collectionView.visibleCells
        cells.forEach({cell in
            let imageCell = cell as! ImageCell
            imageCell.image.hero.id = ""
        })
    }
  // MARK: Do something
  
    @IBOutlet weak var collectionView: UICollectionView!
  
    let spaceBeweenColumns = 4.0
    let totalColumns = 3.0
    var sharedMedias: [SharedMedia] = []
    
  
    func addRefreshControl() {
        Utilities.UI {
            self.collectionView.refreshControl = UIRefreshControl()
            self.collectionView.refreshControl?.addTarget(self, action: #selector(self.pullToRefresh), for: .valueChanged)
        }
    }
    @objc func pullToRefresh(){
        self.collectionView.refreshControl?.beginRefreshing()
        self.getSharedMedia()
    }
    
    func getSharedMedia() {
        let request = MainModel.SharedMediaModel.Request(offset: 0, limit: 21)
        interactor?.getSharedMedia(request: request)
    }
  
    func displaySharedMedia(viewModel: MainModel.SharedMediaModel.ViewModel) {
        sharedMedias = viewModel.result
        Utilities.UI {
            self.collectionView.refreshControl?.endRefreshing()
            self.collectionView.reloadData()
        }
    }
    
    func displayDataPassing() {
        router?.routToFullScreen()
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sharedMedias.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! ImageCell
        let media = sharedMedias[indexPath.row]
        cell.config(media: media)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let totalSpace = (totalColumns + 1.0) * spaceBeweenColumns
        let width = ((collectionView.bounds.width - totalSpace) / totalColumns )
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ImageCell
        cell.image.hero.id = "heroImageId"
        let placeHolderImgae = cell.image.image
        let media = sharedMedias[indexPath.row]
        interactor?.setDataStore(media: media, placeHolder: placeHolderImgae)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if self.sharedMedias.count > 0 {
            return .zero
        }

        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height / 2.0)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "loadingView", for: indexPath)
        return view
    }
    
    
}
