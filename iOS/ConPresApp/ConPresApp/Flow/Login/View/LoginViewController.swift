//
//  ViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 26/06/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    // MARK: Variables
    var userType = 0
    
    var viewModel = LoginViewModel()
        
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Imperatives
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        if #available(iOS 13, *) {
            // Set the default presentation style to continue being full screen
            // (iOS 13 changes it with a new animation).
            viewControllerToPresent.modalPresentationStyle = .fullScreen
        }

        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    // MARK: Internal methods
    func changeUserType() {
        if userType == 3 {
            userType = 0
        } else {
            userType = userType + 1
        }
    }
    
    // MARK: Action
    @IBAction func loginAction(_ sender: Any) {
        UserDefaults.UserType = userType
        performSegue(withIdentifier: "showHomeSegue", sender: nil)
    }
    
    @IBAction func setUserTypeAction(_ sender: Any) {
        changeUserType()
    }
}
