//
//  BaseNavigationViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 26/06/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
    var statusBarStyle: UIStatusBarStyle = .darkContent {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    private func setupNavigationBar() {
        self.navigationBar.barTintColor = UIColor.white
        self.navigationBar.tintColor = UIColor.black
        self.title = "NAVBAR"
//        self.navigationBar.backIndicatorImage = UIImage(named: "ic_arrow_back")
//        self.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "ic_arrow_back")
//        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
    
    func removeNavigationBottomLine() {
        DispatchQueue.main.async {
            let navigationBar = self.navigationBar
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
        }
    }
}
