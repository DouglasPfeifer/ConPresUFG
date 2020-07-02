//
//  SideMenuTableViewCell.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 01/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    static let identifier: String = "sideMenuCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: Variable
    var title: String? {
        didSet {
            setup()
        }
    }
    
    // MARK: Setup
    private func setup() {
        self.titleLabel.text = self.title
        self.titleLabel.textColor = UIColor.white
        self.backgroundColor = UIColor(red: 0.275, green: 0.380, blue: 0.420, alpha: 1)
    }
}
