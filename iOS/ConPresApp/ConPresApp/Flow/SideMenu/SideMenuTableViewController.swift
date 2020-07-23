//
//  SideMenuTableViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 02/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit
import SideMenu

class SideMenuTableViewController: UITableViewController {
    
    // MARK: Variables
    var viewModel: SideMenuViewModel!
    
    var baseController: UINavigationController!
    
    var registerAttendanceVC = RegisterAttendanceViewController()
    var checkAttendanceVC = CheckAttendanceViewController()
    var studentsAttendanceVC = StudentsAttendanceViewController()
    var sendToSIGAAVC = SendToSIGAAViewController()
    var lecturersAttendanceVC = LecturersAttendanceViewController()
    var offerClassVC = OfferClassViewController()
    var addCalendarVC = AddCalendarViewController()
    var addDisciplineVC = AddDisciplineViewController()
    var addLecturerVC = AddLecturerViewController()
    var addClassroomVC = AddClassroomViewController()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = SideMenuViewModel()
        
        initViewControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.separatorStyle = .none
        
        // refresh cell blur effect in case it changed
        tableView.reloadData()
        guard let menu = navigationController as? SideMenuNavigationController, menu.blurEffectStyle == nil else {
            return
        }
    }
    
    // MARK: Functions
    func initViewControllers() {
        registerAttendanceVC = UIStoryboard.instantiateController(
            fromStoryboardNamed: StoryboardName.registerAttendance.rawValue,
            usingControllerIdentifier: StoryboardIdentifier.registerAttendanceViewController.rawValue
        )
        checkAttendanceVC = UIStoryboard.instantiateController(
            fromStoryboardNamed: StoryboardName.checkAttendance.rawValue,
            usingControllerIdentifier: StoryboardIdentifier.checkAttendanceViewController.rawValue
        )
        studentsAttendanceVC = UIStoryboard.instantiateController(
            fromStoryboardNamed: StoryboardName.studentsAttendance.rawValue,
            usingControllerIdentifier: StoryboardIdentifier.studentsAttendanceViewController.rawValue
        )
        sendToSIGAAVC = UIStoryboard.instantiateController(
            fromStoryboardNamed: StoryboardName.sendToSIGAA.rawValue,
            usingControllerIdentifier: StoryboardIdentifier.sendToSIGAAViewController.rawValue
        )
        lecturersAttendanceVC = UIStoryboard.instantiateController(
            fromStoryboardNamed: StoryboardName.lecturersAttendance.rawValue,
            usingControllerIdentifier: StoryboardIdentifier.lecturersAttendanceViewController.rawValue
        )
        offerClassVC = UIStoryboard.instantiateController(
            fromStoryboardNamed: StoryboardName.offerClass.rawValue,
            usingControllerIdentifier: StoryboardIdentifier.offerClassViewController.rawValue
        )
        addCalendarVC = UIStoryboard.instantiateController(
            fromStoryboardNamed: StoryboardName.addCalendar.rawValue,
            usingControllerIdentifier: StoryboardIdentifier.addCalendarViewController.rawValue
        )
        addDisciplineVC = UIStoryboard.instantiateController(
            fromStoryboardNamed: StoryboardName.addDiscipline.rawValue,
            usingControllerIdentifier: StoryboardIdentifier.addDisciplineViewController.rawValue
        )
        addLecturerVC = UIStoryboard.instantiateController(
            fromStoryboardNamed: StoryboardName.addLecturer.rawValue,
            usingControllerIdentifier: StoryboardIdentifier.addLecturerViewController.rawValue
        )
        addClassroomVC = UIStoryboard.instantiateController(
            fromStoryboardNamed: StoryboardName.addClassroom.rawValue,
            usingControllerIdentifier: StoryboardIdentifier.addClassroomViewController.rawValue
        )
    }
    
    // MARK: TableViewDelegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewModel.userType {
        case UserTypes.student.rawValue:
            return NumMenuOptions.student
        case UserTypes.teacher.rawValue:
            return NumMenuOptions.teacher
        case UserTypes.NDE.rawValue:
            return NumMenuOptions.NDE
        case UserTypes.courseCoordinator.rawValue:
            return NumMenuOptions.courseCoordinator
        default:
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardIdentifier.sideMenuCell.rawValue, for: indexPath) as! SideMenuTableViewCell
        let row = indexPath.row
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .gray
        cell.selectedBackgroundView = backgroundView
        
        switch viewModel.userType {
        case UserTypes.student.rawValue:
            if row == 0 {
                cell.titleLabel?.text = Localizable.Menu.registerAttendance
            } else if row == 1 {
                cell.titleLabel?.text = Localizable.Menu.checkAttendance
            }
        case UserTypes.teacher.rawValue:
            if row == 0 {
                cell.titleLabel?.text = Localizable.Menu.registerAttendance
            } else if row == 1 {
                cell.titleLabel?.text = Localizable.Menu.checkAttendance
            } else if row == 2 {
                cell.titleLabel?.text = Localizable.Menu.studentsAttendance
            } else if row == 3 {
                cell.titleLabel?.text = Localizable.Menu.sendToSIGAA
            }
        case UserTypes.NDE.rawValue:
            if row == 0 {
                cell.titleLabel?.text = Localizable.Menu.lecturersAttendance
            } else if row == 1 {
                cell.titleLabel?.text = Localizable.Menu.studentsAttendance
            }
        case UserTypes.courseCoordinator.rawValue:
            if row == 0 {
                cell.titleLabel?.text = Localizable.Menu.lecturersAttendance
            } else if row == 1 {
                cell.titleLabel?.text = Localizable.Menu.studentsAttendance
            } else if row == 2 {
                cell.titleLabel?.text = Localizable.Menu.offerClass
            } else if row == 3 {
                cell.titleLabel?.text = Localizable.Menu.addCalendar
            } else if row == 4 {
                cell.titleLabel?.text = Localizable.Menu.addDiscipline
            } else if row == 5 {
                cell.titleLabel?.text = Localizable.Menu.addLecturer
            } else if row == 6 {
                cell.titleLabel?.text = Localizable.Menu.addClassroom
            }
        default:
            return cell
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        switch viewModel.userType {
        case UserTypes.student.rawValue:
            switch row {
            case 0:
                self.navigationController?.pushViewController(registerAttendanceVC, animated: true)
            case 1:
                self.navigationController?.pushViewController(checkAttendanceVC, animated: true)
            default:
                break
            }
        case UserTypes.teacher.rawValue:
            switch row {
            case 0:
                self.navigationController?.pushViewController(registerAttendanceVC, animated: true)
            case 1:
                self.navigationController?.pushViewController(checkAttendanceVC, animated: true)
            case 2:
                self.navigationController?.pushViewController(studentsAttendanceVC, animated: true)
            case 3:
                self.navigationController?.pushViewController(sendToSIGAAVC, animated: true)
            default:
                break
            }
        case UserTypes.NDE.rawValue:
            switch row {
            case 0:
                self.navigationController?.pushViewController(lecturersAttendanceVC, animated: true)
            case 1:
                self.navigationController?.pushViewController(studentsAttendanceVC, animated: true)
            default:
                break
            }
        case UserTypes.courseCoordinator.rawValue:
            switch row {
            case 0:
                self.navigationController?.pushViewController(lecturersAttendanceVC, animated: true)
            case 1:
                self.navigationController?.pushViewController(studentsAttendanceVC, animated: true)
            case 2:
                self.navigationController?.pushViewController(offerClassVC, animated: true)
            case 3:
                self.navigationController?.pushViewController(addCalendarVC, animated: true)
            case 4:
                self.navigationController?.pushViewController(addDisciplineVC, animated: true)
            case 5:
                self.navigationController?.pushViewController(addLecturerVC, animated: true)
            case 6:
                self.navigationController?.pushViewController(addClassroomVC, animated: true)
            default:
                break
            }
        default:
            break
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
