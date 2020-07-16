//
//  BaseViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 26/06/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit
import Moya

/// The base implementation for all controllers using the app to inherit from.
class BaseViewController: UIViewController {

    // MARK: Variables
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    // MARK: Imperatives
    open override func awakeFromNib() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.title = self.title
        navigationItem.backBarButtonItem?.tintColor = UIColor.black
    }
}
