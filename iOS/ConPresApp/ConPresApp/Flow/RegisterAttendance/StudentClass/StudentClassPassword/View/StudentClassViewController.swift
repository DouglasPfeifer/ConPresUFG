//
//  StudentClassViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 01/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit

class StudentClassPasswordViewController: UIViewController {

    // MARK: Variables
    @IBOutlet weak var passwordTextField: UITextField!
    
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
    @IBAction func enterClassroomAction(_ sender: Any) {
        performSegue(withIdentifier: StoryboardIdentifier.showStudentClassSegue.rawValue, sender: nil)
    }
}
