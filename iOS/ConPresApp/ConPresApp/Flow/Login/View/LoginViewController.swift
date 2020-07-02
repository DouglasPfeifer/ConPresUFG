//
//  ViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 26/06/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit
import RxSwift

class LoginViewController: BaseViewController {
    
    // MARK: Parameters
    var viewModel = LoginViewModel()
    
    private(set) var goToHome = PublishSubject<Void>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginAction(_ sender: Any) {
        goToHome.onNext(())
    }
}
