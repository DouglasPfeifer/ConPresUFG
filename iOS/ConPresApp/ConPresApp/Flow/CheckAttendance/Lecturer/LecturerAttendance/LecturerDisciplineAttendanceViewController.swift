//
//  LecturerDisciplineAttendanceViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 20/12/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit

class LecturerDisciplineAttendanceViewController: BaseViewController {

    @IBOutlet weak var disciplineNameLabel: UILabel!
    @IBOutlet weak var totaLessonsLabel: UILabel!
    @IBOutlet weak var lessonsLecturedLabel: UILabel!
    @IBOutlet weak var sendToSIGAA: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: LecturerDisciplineAttendanceViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Aulas"
        
        setupLabels()
        setupTableView()
    }
    
    private func setupLabels() {
        // Start MOCK
        totaLessonsLabel.text = "24"
        lessonsLecturedLabel.text = "20"
        //  End MOCK
        
        disciplineNameLabel.text = viewModel.currentDiscipline.name
//        totaLessonsLabel.text = "\(viewModel.totalNumberOfLessons)"
//        lessonsLecturedLabel.text = "\(viewModel.numberOfLessons ?? 0)"
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: Actions
    @IBAction func sendToSIGAA(_ sender: Any) {
        viewModel.sendToSIGAA()
    }
    
    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case StoryboardIdentifier.showLecturerLessonAttendanceSegue.rawValue:
            let lecturerLessonAttendanceVC = segue.destination as! LecturerLessonAttendanceViewController
            if let selectedLesson = viewModel.selectedLesson {
                lecturerLessonAttendanceVC.viewModel = LecturerLessonAttendanceViewModel(currentLesson: selectedLesson)
            }
        default:
            return
        }
    }
}

// MARK: Tableview Delegate
extension LecturerDisciplineAttendanceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Start MOCK
        return 4
        // End MOCK
        
//        guard let disciplineLessons = viewModel.disciplineLessons else {
//            return 0
//        }
//        return disciplineLessons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardIdentifier.lecturerDisciplineAttendanceCell.rawValue, for: indexPath) as! LecturerDisciplineAttendanceTableViewCell
        
        // Start MOCK
        if indexPath.row == 0 {
            cell.lessonNameLabel.text = "Segunda-Feira - 21/12/2020"
            cell.classroomLabel.text = "Campus Samambaia - CAB 201"
            cell.scheduleLabel.text = "08:00 às 9:40"
        } else if indexPath.row == 1 {
            cell.lessonNameLabel.text = "Quinta-Feira - 17/12/2020"
            cell.classroomLabel.text = "Campus Samambaia - CAB 304"
            cell.scheduleLabel.text = "08:00 às 9:40"
        } else if indexPath.row == 2 {
            cell.lessonNameLabel.text = "Segunda-Feira - 14/12/2020"
            cell.classroomLabel.text = "Campus Samambaia - CAB 201"
            cell.scheduleLabel.text = "08:00 às 9:40"
        } else if indexPath.row == 3 {
            cell.lessonNameLabel.text = "Quinta-Feira - 17/12/2020"
            cell.classroomLabel.text = "Campus Samambaia - CAB 304"
            cell.scheduleLabel.text = "08:00 às 9:40"
        } else {
            cell.lessonNameLabel.text = "Segunda-Feira - 21/12/2020"
            cell.classroomLabel.text = "Campus Samambaia - CAB 201"
            cell.scheduleLabel.text = "08:00 às 9:40"
        }
        // End MOCK
        
//        let cellLesson = viewModel.disciplineLessons[indexPath.row]
//        cell.lessonNameLabel.text = viewModel.getDisciplineLessonsNames(rowLesson: cellLesson)
//        cell.classroomLabel.text = String(describing: cellLesson.classroom!)
//        cell.scheduleLabel.text = viewModel.getLessonTimeInterval(rowLesson: cellLesson)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        viewModel.setSelectedLesson(row: row)
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: StoryboardIdentifier.showLecturerLessonAttendanceSegue.rawValue, sender: nil)
    }
}
