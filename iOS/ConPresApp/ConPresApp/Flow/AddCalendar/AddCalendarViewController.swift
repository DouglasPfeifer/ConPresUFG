//
//  AddCalendarViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 23/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit

class AddCalendarViewController: UIViewController {

    var academicCalendar: AcademicCalendar!
    
    @IBOutlet weak var semesterSegmentedControl: UISegmentedControl!
    @IBOutlet weak var semesterStartDatePicker: UIDatePicker!
    @IBOutlet weak var semesterEndDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveCalendar(_ sender: Any) {
        let semester = 1 + semesterSegmentedControl.selectedSegmentIndex
        
        let semesterStartDateComponents = semesterStartDatePicker.calendar.dateComponents([.year], from: semesterStartDatePicker.date)
        let calendarCode = CalendarCode(year: semesterStartDateComponents.year, semester: semester)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        let semesterStartDateString = formatter.string(from: semesterStartDatePicker.date)
        let semesterEndDateString = formatter.string(from: semesterEndDatePicker.date)
        let calendarUUID = UUID().uuidString
        
        AcademicCalendar(ID: calendarUUID, code: calendarCode, semesterStartDate: semesterStartDateString, semesterEndDate: semesterEndDateString, semesterHolidayDates: nil)
    }
}
