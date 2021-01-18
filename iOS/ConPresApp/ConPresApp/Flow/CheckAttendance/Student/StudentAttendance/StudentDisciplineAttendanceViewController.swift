//
//  StudentDisciplineAttendanceViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 05/12/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation
import UIKit

class StudentDisciplineAttendanceViewController: BaseViewController {
    
    // MARK: Properties
    @IBOutlet weak var disciplineNameLabel: UILabel!
    @IBOutlet weak var totalLessonsLabel: UILabel!
    @IBOutlet weak var attendancesLabel: UILabel!
    @IBOutlet weak var absencesLabel: UILabel!
    @IBOutlet weak var assiduityLabel: UILabel!
    
    @IBOutlet weak var numberOfLessonsLabel: UILabel!
    @IBOutlet weak var numberOfAttendancesLabel: UILabel!
    @IBOutlet weak var numberOfAbsencesLabel: UILabel!
    @IBOutlet weak var assiduityPercentageLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: StudentDisciplineAttendanceViewModel!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupTableView()
    }
    
    // MARK: Internal methods
    private func setupLayout() {
        setupLabels()
    }
    
    private func setupLabels() {
        // Start MOCK
//        disciplineNameLabel.text = "Engenharia de Requisitos"
//        numberOfLessonsLabel.text = "38"
//        numberOfAttendancesLabel.text = "30"
//        numberOfAbsencesLabel.text = "1"
//        assiduityPercentageLabel.text = "8"
        // End MOCK
        
        disciplineNameLabel.text = viewModel.currentDiscipline
        numberOfLessonsLabel.text = "\(viewModel.numberOfLessons ?? 0)"
        numberOfAttendancesLabel.text = "\(viewModel.numberOfAttendances ?? 0)"
        numberOfAbsencesLabel.text = "\(viewModel.numberOfAbsences ?? 0)"
        assiduityPercentageLabel.text = "\(viewModel.maxAbsences ?? 0.0)"
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: Tableview Delegate
extension StudentDisciplineAttendanceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let disciplineLessons = viewModel.disciplineLessons else {
            return 0
        }
        return disciplineLessons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardIdentifier.studentDisciplineAttendanceCell.rawValue, for: indexPath) as! StudentDisciplineAttendanceTableViewCell
        let cellLesson = viewModel.disciplineLessons[indexPath.row]
        
        // Start MOCK
//        if indexPath.row == 0 {
//            cell.lessonNameLabel.text = "Segunda-Feira - 21/12/2020"
//            cell.lecturerNameLabel.text = "Juliano Lopes de Oliveira"
//            cell.classroomLabel.text = "Campus Samambaia - CAB 201"
//            cell.scheduleLabel.text = "08:00 às 9:40"
//            cell.lessonStatusImageView.image = UIImage(systemName: "person.fill.checkmark.rtl")!.withRenderingMode(.alwaysTemplate)
//            cell.lessonStatusImageView.tintColor = UIColor.systemGreen
//        } else if indexPath.row == 1 {
//            cell.lessonNameLabel.text = "Quinta-Feira - 17/12/2020"
//            cell.lecturerNameLabel.text = "Juliano Lopes de Oliveira"
//            cell.classroomLabel.text = "Campus Samambaia - CAB 304"
//            cell.scheduleLabel.text = "08:00 às 9:40"
//            cell.lessonStatusImageView.image = UIImage(systemName: "person.fill.checkmark.rtl")!.withRenderingMode(.alwaysTemplate)
//            cell.lessonStatusImageView.tintColor = UIColor.systemGreen
//        } else if indexPath.row == 2 {
//            cell.lessonNameLabel.text = "Segunda-Feira - 14/12/2020"
//            cell.lecturerNameLabel.text = "Juliano Lopes de Oliveira"
//            cell.classroomLabel.text = "Campus Samambaia - CAB 201"
//            cell.scheduleLabel.text = "08:00 às 9:40"
//            cell.lessonStatusImageView.image = UIImage(systemName: "person.fill.xmark.rtl")!.withRenderingMode(.alwaysTemplate)
//            cell.lessonStatusImageView.tintColor = UIColor.systemRed
//        } else {
//            cell.lessonNameLabel.text = "Quinta-Feira - 17/12/2020"
//            cell.lecturerNameLabel.text = "Juliano Lopes de Oliveira"
//            cell.classroomLabel.text = "Campus Samambaia - CAB 304"
//            cell.scheduleLabel.text = "08:00 às 9:40"
//            cell.lessonStatusImageView.image = UIImage(systemName: "person.fill.checkmark.rtl")!.withRenderingMode(.alwaysTemplate)
//            cell.lessonStatusImageView.tintColor = UIColor.systemGreen
//        }
        // End MOCK
        
        cell.lessonNameLabel.text = viewModel.getDisciplineLessonsNames(rowLesson: cellLesson)
        cell.lecturerNameLabel.text = cellLesson.lecturer
        cell.classroomLabel.text = String(describing: cellLesson.classroom!)
        cell.scheduleLabel.text = viewModel.getLessonTimeInterval(rowLesson: cellLesson)

        guard let cellLessonAttendance = cellLesson.attendance else {
            cell.lessonStatusImageView.image = UIImage(systemName: "person.fill.questionmark.rtl")!.withRenderingMode(.alwaysTemplate)
            cell.lessonStatusImageView.tintColor = UIColor.systemBlue
            return cell
        }
        if cellLessonAttendance == 1 {
            cell.lessonStatusImageView.image = UIImage(systemName: "person.fill.checkmark.rtl")!.withRenderingMode(.alwaysTemplate)
            cell.lessonStatusImageView.tintColor = UIColor.systemGreen
        } else {
            cell.lessonStatusImageView.image = UIImage(systemName: "person.fill.xmark.rtl")!.withRenderingMode(.alwaysTemplate)
            cell.lessonStatusImageView.tintColor = UIColor.systemRed
        }
        
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
