//
//  teacherClassViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 01/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit

class TeacherClassViewController: UIViewController {

    // MARK: Variables
    
    var viewModel: TeacherClassViewModel!

    // MARK: Lifeclycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = TeacherClassViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // MARK: Action
    @IBAction func startClassAction(_ sender: Any) {
        viewModel!.startClass()
    }
}
