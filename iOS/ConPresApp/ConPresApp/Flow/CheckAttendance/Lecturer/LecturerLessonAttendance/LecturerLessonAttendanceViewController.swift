//
//  LecturerLessonAttendanceViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 20/12/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit

class LecturerLessonAttendanceViewController: BaseViewController {
    
    // MARK: Properties
    @IBOutlet weak var lessonNameLabel: UILabel!
    @IBOutlet weak var totalNumberOfStudentsLabel: UILabel!
    @IBOutlet weak var attendedNumberOfStudentsLabel: UILabel!
    @IBOutlet weak var updateAttendances: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: LecturerLessonAttendanceViewModel!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Presenças"
        updateAttendances.alpha = 0.4
        updateAttendances.isEnabled = false
        
        setupLabels()
        setupTableView()
    }
    
    // MARK: Internal methods
    private func setupLabels() {
        // Start MOCK
        lessonNameLabel.text = "Segunda-Feira - 21/12/2020"
        // End MOCK
        
//        lessonNameLabel.text = "\(viewModel.currentLesson.startTime!.convertToDate().getDayMonthYear())"
//        totalNumberOfStudentsLabel.text = "\(viewModel.currentLesson.lecturerStudents!.count)"
//        attendedNumberOfStudentsLabel.text = "\(viewModel.getNumberOfAttendants())"
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: Actions
    @IBAction func updateAttendances(_ sender: Any) {
        viewModel.updateCurrentLessonState()
        updateAttendances.alpha = 0.4
        updateAttendances.isEnabled = false
    }
}

// MARK: Tableview Delegate
extension LecturerLessonAttendanceViewController: UITableViewDelegate, UITableViewDataSource, StudentAttendanceCellProtocol {
    func changeStudentAttendance(row: Int, attendend: Bool) {
        viewModel.changeStudentAttendanceStatus(row: row, attended: attendend)
        tableView.reloadRows(at: [IndexPath(row: row, section: 0)], with: .automatic)
        attendedNumberOfStudentsLabel.text = "\(viewModel.getNumberOfAttendants())"
        if viewModel.checkIfNeedsUpdate() {
            updateAttendances.alpha = 1.0
            updateAttendances.isEnabled = true
        } else {
            updateAttendances.alpha = 0.4
            updateAttendances.isEnabled = false
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let lessonStudents = viewModel.currentLesson.lecturerStudents else {
            return 0
        }
        return lessonStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardIdentifier.lecturerLessonAttendanceTableViewCell.rawValue, for: indexPath) as! LecturerLessonAttendanceTableViewCell
        cell.row = indexPath.row
        
        // Start MOCK
        if indexPath.row == 0 {
            cell.studentNameLabel.text = "Carlos Alberto do Campo"
        } else if indexPath.row == 1 {
            cell.studentNameLabel.text = "Coralina Carvalho de Arantes"
        } else if indexPath.row == 2 {
            cell.studentNameLabel.text = "João da Silva Morais"
        } else if indexPath.row == 3 {
            cell.studentNameLabel.text = "Josimar Pedro Guimarães"
        } else if indexPath.row == 4 {
            cell.studentNameLabel.text = "Lucio Borges Neto"
        } else if indexPath.row == 5 {
            cell.studentNameLabel.text = "Maria das Lurdes Neto"
        } else if indexPath.row == 6 {
            cell.studentNameLabel.text = "Murilo Pereira"
        } else if indexPath.row == 7 {
            cell.studentNameLabel.text = "Pedro Augusto das Neves"
        }
        // End Mock
        
        let cellStudent = viewModel.getRowStudent(row: indexPath.row)
        
//        cell.studentNameLabel.text = cellStudent.name
        cell.attendanceSwitch.isOn = cellStudent.attendance!
        guard let cellStudentAttendance = cellStudent.attendance else {
            cell.studentAttendanceStatusImageView.image = UIImage(systemName: "person.fill.questionmark.rtl")!.withRenderingMode(.alwaysTemplate)
            cell.studentAttendanceStatusImageView.tintColor = UIColor.systemBlue
            return cell
        }
        if cellStudentAttendance {
            cell.studentAttendanceStatusImageView.image = UIImage(systemName: "person.fill.checkmark.rtl")!.withRenderingMode(.alwaysTemplate)
            cell.studentAttendanceStatusImageView.tintColor = UIColor.systemGreen
        } else {
            cell.studentAttendanceStatusImageView.image = UIImage(systemName: "person.fill.xmark.rtl")!.withRenderingMode(.alwaysTemplate)
            cell.studentAttendanceStatusImageView.tintColor = UIColor.systemRed
        }
        
        cell.delegate = self
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

