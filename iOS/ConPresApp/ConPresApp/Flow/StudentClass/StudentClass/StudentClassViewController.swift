//
//  StudentClassViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 16/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation
import UIKit

class StudentClassViewController: BaseViewController {
    
    // MARK: Variables
    var viewModel: StudentClassViewModel!

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = StudentClassViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // MARK: Action
    @IBAction func GPSAction(_ sender: Any) {
        viewModel.askForGPSPermission()
        viewModel.getLocation()
    }
    
    @IBAction func confirmAttendanceAction(_ sender: Any) {
        viewModel.getDeviceID()
    }
}
