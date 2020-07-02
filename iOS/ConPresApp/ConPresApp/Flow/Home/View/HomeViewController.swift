//
//  HomeViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 29/06/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit
import RxSwift

class HomeViewController: BaseViewController {
    
    private(set) var displayMenu = PublishSubject<Void>()

    var viewModel = HomeViewModel()
    
    var menuButton: UIBarButtonItem?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("home")
        // Do any additional setup after loading the view.
    }
    
    //MARK: Bindinga
    func setupMenuBar() {
        
        menuButton = UIBarButtonItem(
            image: UIImage(named: "ic_menu"),
            style: .plain,
            target: nil,
            action: nil
        )
        
        menuButton?.rx
            .tap
            .subscribe(displayMenu)
            .disposed(by: disposeBag)
        
        self.navigationItem.leftBarButtonItem = menuButton
    }
}
