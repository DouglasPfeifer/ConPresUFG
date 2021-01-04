//
//  StudentDisciplineViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 03/12/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit

class StudentDisciplineViewController: BaseViewController {
    
    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    let refreshControl = UIRefreshControl()
    
    var viewModel: StudentDisciplineViewModel!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = StudentDisciplineViewModel()

        setupTableView()
    }
    
    // MARK: Internal methods
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        refreshControl.addTarget(self, action: #selector(updateView), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    // MARK: Actions
    @objc func updateView(refreshControl: UIRefreshControl) {
//        getDisciplines()
        refreshControl.endRefreshing()
    }
    
    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case StoryboardIdentifier.showStudentDisciplineAttendanceSegue.rawValue:
            let studentDisciplineAttendanceVC = segue.destination as! StudentDisciplineAttendanceViewController
            if let selectedDiscipline = viewModel.selectedDiscipline {
                studentDisciplineAttendanceVC.viewModel = StudentDisciplineAttendanceViewModel(currentDiscipline: selectedDiscipline)
            }
            print("asdasd")
        default:
            return
        }
    }
}


// MARK: Tableview Delegate
extension StudentDisciplineViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let studentDisciplines = viewModel.studentDisciplines else {
            return 0
        }
        return studentDisciplines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardIdentifier.studentDisciplineCell.rawValue, for: indexPath) as! StudentDisciplineTableViewCell
        let row: Int = indexPath.row

        guard let studentDisciplines = viewModel.studentDisciplines,
              let discipline = studentDisciplines[row] else {
            cell.disciplineName.text = "Disciplina sem nome"
            return cell
        }
        cell.disciplineName.text = discipline
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.setSelectedDiscipline(row: indexPath.row)
        self.performSegue(withIdentifier: StoryboardIdentifier.showStudentDisciplineAttendanceSegue.rawValue, sender: nil)
    }
}
