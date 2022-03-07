//
//  SuperViewController.swift
//  NewsApp
//
//  Created by Mohannad on 3/6/22.
//

import UIKit
import RxSwift

class SuperViewController: UIViewController {
    
    weak var coordinator : MainCoordinator?
    
    var infoAlert : InfoAlert?
    
    var indicatorAlert : IndicatorAlert?
    
    let disposeBag  = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configureInfoAlert(){
        self.infoAlert = InfoAlert()
        self.infoAlert?.onCompletedHideAction = { [weak self] in
            self?.infoAlert = nil
        }
    }
    
    func configureIndicatorAlert(){
        indicatorAlert = IndicatorAlert()
        self.indicatorAlert?.onCompletedHideAction = { [weak self] in
            self?.indicatorAlert = nil
        }
    }
    


}
