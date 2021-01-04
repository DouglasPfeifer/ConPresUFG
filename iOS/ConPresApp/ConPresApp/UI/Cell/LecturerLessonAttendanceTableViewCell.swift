//
//  LecturerLessonAttendanceTableViewCell.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 20/12/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit

protocol StudentAttendanceCellProtocol {
    func changeStudentAttendance(row: Int, attendend: Bool)
}

class LecturerLessonAttendanceTableViewCell: UITableViewCell {

    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var attendanceSwitch: UISwitch!
    @IBOutlet weak var studentAttendanceStatusImageView: UIImageView!
    
    var row: Int!
    
    var delegate: StudentAttendanceCellProtocol? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func changeStudentAttendanceStatus(_ sender: Any) {
        if self.delegate != nil {
            self.delegate?.changeStudentAttendance(row: row, attendend: attendanceSwitch.isOn)
        }
    }
}
