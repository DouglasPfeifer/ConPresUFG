//
//  LecturerDisciplineAttendanceTableViewCell.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 20/12/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit

class LecturerDisciplineAttendanceTableViewCell: UITableViewCell {

    @IBOutlet weak var lessonNameLabel: UILabel!
    @IBOutlet weak var classroomLabel: UILabel!
    @IBOutlet weak var scheduleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
