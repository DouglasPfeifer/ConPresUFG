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
    
    var viewModel: HomeViewModel!
            
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = HomeViewModel()
        
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
        case UserTypes.teacher.rawValue:
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
    
    // MARK: Actions
    @IBAction func addButtonAction(_ sender: Any) {
        switch viewModel.userType {
        case UserTypes.teacher.rawValue:
            self.performSegue(withIdentifier: StoryboardIdentifier.showAddClassSegue.rawValue, sender: nil)
        default:
            return
        }
    }
}

// MARK: TableView Delegate
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.getHeaderTitleFor(section: section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfRows = viewModel.getNumberRowsInSection(section: section) else { return 0 }
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
            
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardIdentifier.homeCell.rawValue, for: indexPath) as! HomeTableViewCell

        guard let header = viewModel.getHeaderTitleFor(section: indexPath.section) else { return cell }
        guard let sectionClasses = viewModel.classesByHeader[header] else { return cell }
        let row = indexPath.row
        let rowClass = sectionClasses[row]
        let schedule = viewModel.getClassTimeInterval(rowClass: rowClass)
        
        cell.courseLabel.text = rowClass.discipline
        cell.lecturerLabel.text = rowClass.lecturer
        cell.classroomLabel.text = rowClass.classroom
        cell.scheduleLabel.text = schedule
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        if viewModel.userType == UserTypes.student.rawValue {
            viewModel.setCurrentClass(section: indexPath.section, row: indexPath.row)
            self.performSegue(withIdentifier: StoryboardIdentifier.showStudentClassSegue.rawValue, sender: nil)
        }
    }
    
    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case StoryboardIdentifier.showStudentClassSegue.rawValue:
            let studentClassViewController = segue.destination as! StudentClassViewController
            if let currentClass = viewModel.selectedClass {
                studentClassViewController.viewModel = StudentClassViewModel(currentClass: currentClass)
            }
        case StoryboardIdentifier.showAddClassSegue.rawValue:
            let addClassroomViewController = segue.destination as! AddClassViewController
        default:
            return
        }
        
        guard let sideMenuNavigationController = segue.destination as? SideMenuNavigationController else { return }
        sideMenuNavigationController.settings = makeSettings()
    }
}
