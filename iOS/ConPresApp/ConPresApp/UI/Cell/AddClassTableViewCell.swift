//
//  AddClassTableViewCell.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 27/08/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit

class AddClassTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    
    var cellClass: Class? {
        didSet {
            self.dateLabel.text = cellClass?.startDate
            self.startTimeLabel.text = cellClass?.startTime
            self.endTimeLabel.text = cellClass?.endTime
        }
    }
}
