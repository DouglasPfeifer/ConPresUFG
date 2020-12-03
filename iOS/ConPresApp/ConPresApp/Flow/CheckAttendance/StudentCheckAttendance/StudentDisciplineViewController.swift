//
//  StudentDisciplineViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 03/12/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit

class StudentDisciplineViewController: BaseViewController {
    
    var viewModel: StudentDisciplineViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = StudentDisciplineViewModel()
        // Do any additional setup after loading the view.
    }
}

extension StudentDisciplineViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    
}
