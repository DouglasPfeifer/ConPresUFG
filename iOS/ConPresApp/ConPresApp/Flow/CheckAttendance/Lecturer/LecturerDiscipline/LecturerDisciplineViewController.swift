//
//  LecturerDisciplineViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 20/12/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit

class LecturerDisciplineViewController: BaseViewController {

    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: LecturerDisciplineViewModel!

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = LecturerDisciplineViewModel()
        
        self.title = "Disciplinas"
        setupTableView()
    }
    
    // MARK: Internal methods
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case StoryboardIdentifier.showLecturerDisciplineAttendanceSegue.rawValue:
            let lecturerDisciplineAttendanceVC = segue.destination as! LecturerDisciplineAttendanceViewController
            if let selectedDiscipline = viewModel.selectedDiscipline {
                lecturerDisciplineAttendanceVC.viewModel = LecturerDisciplineAttendanceViewModel(currentDiscipline: selectedDiscipline)
            }
        default:
            return
        }
    }
}

// MARK: Tableview Delegate
extension LecturerDisciplineViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let lecturerDisciplines = viewModel.lecturerDisciplines else {
            return 0
        }
        return lecturerDisciplines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardIdentifier.lecturerDisciplineCell.rawValue, for: indexPath) as! LecturerDisciplineTableViewCell
        let row: Int = indexPath.row

        guard let studentDisciplines = viewModel.lecturerDisciplines,
              let discipline = studentDisciplines[row].name else {
            cell.disciplineName.text = "Disciplina sem nome"
            return cell
        }
        cell.disciplineName.text = discipline
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.setSelectedDiscipline(row: indexPath.row)
        self.performSegue(withIdentifier: StoryboardIdentifier.showLecturerDisciplineAttendanceSegue.rawValue, sender: nil)
    }
}
