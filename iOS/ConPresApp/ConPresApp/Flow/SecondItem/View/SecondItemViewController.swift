//
//  FirstItemViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 01/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit

class SecondItemViewController: UIViewController {

    // MARK: Variables
    var viewModel: SecondItemViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = SecondItemViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}
