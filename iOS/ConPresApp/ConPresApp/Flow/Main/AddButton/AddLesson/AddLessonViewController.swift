//
//  AddLessonViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 16/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation
import UIKit

class AddLessonViewController: BaseViewController {
    
    // MARK: Properties
    @IBOutlet weak var todayLessonsLabel: UILabel!
    @IBOutlet weak var lessonsTableView: UITableView!
    
    var viewModel: AddLessonViewModel!
    
    private var activeTableViewArray: [[String: String]] = [[:]]
    
    var selectedDiscipline: Discipline!
        
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel = AddLessonViewModel()
        todayLessonsLabel.text = Date().dayOfWeek()
        setupTableView()
    }
    
    // MARK: Internal methods
    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case StoryboardIdentifier.showAddSelectedLessonSegue.rawValue:
            let addSelectedLessonViewController = segue.destination as! AddSelectedLessonViewController
            addSelectedLessonViewController.activeLesson = viewModel.getLessonOfDiscipline(discipline: selectedDiscipline)
        default:
            return
        }
    }
}

// MARK: TableView Delegate
extension AddLessonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedDiscipline = viewModel.disciplines[indexPath.row]
        performSegue(withIdentifier: StoryboardIdentifier.showAddSelectedLessonSegue.rawValue, sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Start MOCK
//        return 1
        // End MOCK
        if viewModel.disciplines.count == 0 {
            tableView.setEmptyMessage(message: "Não há aulas para lecionar hoje")
        }
        return viewModel.disciplines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardIdentifier.addLessonCell.rawValue, for: indexPath) as! AddLessonTableViewCell
        cell.disciplineName.text = viewModel.disciplines[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func setupTableView() {
        lessonsTableView.delegate = self
        lessonsTableView.dataSource = self
    }
}
