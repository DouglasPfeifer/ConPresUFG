//
//  HomeViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 29/06/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit
import SideMenu

class HomeViewController: BaseViewController {
    
    // MARK: Properties
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    let refreshControl = UIRefreshControl()
    
    var viewModel: HomeViewModel!
    var couldntLoadLessons = false
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = HomeViewModel {
            (success) in
            self.couldntLoadLessons = !success
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        setupNavBar()
        setupSideMenu()
        updateMenu()
        setupTableView()
    }
    
    // MARK: Internal methods
    private func setupNavBar() {
        switch viewModel.userType {
        case UserTypes.student.rawValue:
            addButton.isHidden = true
        case UserTypes.lecturer.rawValue:
            addButton.isHidden = false
        default:
            return
        }
    }
    
    private func setupSideMenu() {
        SideMenuManager.default.leftMenuNavigationController = storyboard?.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as? SideMenuNavigationController
    }
    
    private func updateMenu() {
        let settings = makeSettings()
        SideMenuManager.default.leftMenuNavigationController?.settings = settings
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        refreshControl.addTarget(self, action: #selector(updateTableView), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    private func makeSettings() -> SideMenuSettings {
        let presentationStyle = selectedPresentationStyle()
        presentationStyle.backgroundColor = UIColor.white
        presentationStyle.menuStartAlpha = CGFloat(1)
        presentationStyle.menuScaleFactor = CGFloat(1)
        presentationStyle.onTopShadowOpacity = 1
        presentationStyle.presentingEndAlpha = CGFloat(1)
        presentationStyle.presentingScaleFactor = CGFloat(1)

        var settings = SideMenuSettings()
        settings.presentationStyle = presentationStyle
        settings.menuWidth = min(view.frame.width, view.frame.height) * CGFloat(0.75)
        settings.blurEffectStyle = UIBlurEffect.Style.light
        settings.statusBarEndAlpha = 0

        return settings
    }
    
    private func selectedPresentationStyle() -> SideMenuPresentationStyle {
        return SideMenuPresentationStyle.menuSlideIn
    }
    
    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case StoryboardIdentifier.showStudentLessonSegue.rawValue:
            let studentLessonViewController = segue.destination as! StudentLessonViewController
            if let selectedLesson = viewModel.selectedLesson {
                studentLessonViewController.viewModel = StudentLessonViewModel(selectedLesson: selectedLesson)
            }
        case StoryboardIdentifier.showLecturerLessonSegue.rawValue:
            let lecturerLessonViewController = segue.destination as! LecturerLessonViewController
            if let selectedLesson = viewModel.selectedLesson {
                lecturerLessonViewController.viewModel = LecturerLessonViewModel(selectedLesson: selectedLesson)
            }
        case StoryboardIdentifier.showAddLessonSegue.rawValue:
            let addLessonViewController = segue.destination as! AddLessonViewController
        default:
            return
        }
        
        guard let sideMenuNavigationController = segue.destination as? SideMenuNavigationController else { return }
        sideMenuNavigationController.settings = makeSettings()
    }
    
    // MARK: Actions
    @objc func updateTableView(refreshControl: UIRefreshControl) {
        viewModel.getUserLessons {
            (success) in
            self.couldntLoadLessons = !success
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        refreshControl.endRefreshing()
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        switch viewModel.userType {
        case UserTypes.lecturer.rawValue:
            self.performSegue(withIdentifier: StoryboardIdentifier.showAddLessonSegue.rawValue, sender: nil)
        default:
            return
        }
    }
}

// MARK: TableView Delegate
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let numberOfSections = viewModel.getNumberOfSections()
        if numberOfSections != 0 {
            self.tableView.restore()
        } else if couldntLoadLessons {
            self.tableView.setEmptyMessage(message: "Não foi possível carregar a lista\n\nPuxe para baixo")
        } else {
            self.tableView.setAtivityIndicator()
        }
        return numberOfSections
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.getHeaderTitleFor(section: section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = viewModel.getNumberRowsInSection(section: section)
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
            
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardIdentifier.homeCell.rawValue, for: indexPath) as! HomeTableViewCell

        guard let header = viewModel.getHeaderTitleFor(section: indexPath.section) else { return cell }
        guard let sectionLessons = viewModel.lessonsByHeader[header] else { return cell }
        let row = indexPath.row
        let rowLesson = sectionLessons[row]
        let schedule = viewModel.getLessonTimeInterval(rowLesson: rowLesson)
        
        // Start MOCK
        cell.courseLabel.text = "Engenharia de Requisitos"
        cell.lecturerLabel.text = "Juliano Lopes de Oliveira"
        cell.classroomLabel.text = "Campus Samambaia - CAB 201"
        cell.scheduleLabel.text = "08:00 às 9:40"
        cell.lessonStatusImageView.image = UIImage(systemName: "person.fill.questionmark.rtl")!.withRenderingMode(.alwaysTemplate)
        cell.lessonStatusImageView.tintColor = UIColor.systemBlue
        // End MOCK
        
//        cell.courseLabel.text = rowLesson.discipline
//        cell.lecturerLabel.text = rowLesson.lecturer
//        cell.classroomLabel.text = String(describing: rowLesson.classroom!)
//        cell.scheduleLabel.text = schedule
//
//        guard let cellLessonAttendance = rowLesson.attendance else {
//            cell.lessonStatusImageView.image = UIImage(systemName: "person.fill.questionmark.rtl")!.withRenderingMode(.alwaysTemplate)
//            cell.lessonStatusImageView.tintColor = UIColor.systemBlue
//            return cell
//        }
//        if cellLessonAttendance == 1 {
//            cell.lessonStatusImageView.image = UIImage(systemName: "person.fill.checkmark.rtl")!.withRenderingMode(.alwaysTemplate)
//            cell.lessonStatusImageView.tintColor = UIColor.systemGreen
//        } else {
//            cell.lessonStatusImageView.image = UIImage(systemName: "person.fill.xmark.rtl")!.withRenderingMode(.alwaysTemplate)
//            cell.lessonStatusImageView.tintColor = UIColor.systemRed
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if viewModel.userType == UserTypes.student.rawValue {
            viewModel.setSelectedLesson(section: indexPath.section, row: indexPath.row)
            self.performSegue(withIdentifier: StoryboardIdentifier.showStudentLessonSegue.rawValue, sender: nil)
        } else if viewModel.userType == UserTypes.lecturer.rawValue {
            viewModel.setSelectedLesson(section: indexPath.section, row: indexPath.row)
            self.performSegue(withIdentifier: StoryboardIdentifier.showLecturerLessonSegue.rawValue, sender: nil)
        }
    }
}
