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
    
    // MARK: Properties
    var viewModel: SideMenuViewModel!
    
    var baseController: UINavigationController!
    
//    var checkAttendanceVC = CheckAttendanceViewController()
//    var studentsAttendanceVC = StudentsAttendanceViewController()
//    var sendToSIGAAVC = SendToSIGAAViewController()
    
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
//        checkAttendanceVC = UIStoryboard.instantiateController(
//            fromStoryboardNamed: StoryboardName.checkAttendance.rawValue,
//            usingControllerIdentifier: StoryboardIdentifier.checkAttendanceViewController.rawValue
//        )
//        studentsAttendanceVC = UIStoryboard.instantiateController(
//            fromStoryboardNamed: StoryboardName.studentsAttendance.rawValue,
//            usingControllerIdentifier: StoryboardIdentifier.studentsAttendanceViewController.rawValue
//        )
//        sendToSIGAAVC = UIStoryboard.instantiateController(
//            fromStoryboardNamed: StoryboardName.sendToSIGAA.rawValue,
//            usingControllerIdentifier: StoryboardIdentifier.sendToSIGAAViewController.rawValue
//        )
    }
    
    // MARK: TableViewDelegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewModel.userType {
        case UserTypes.student.rawValue:
            return NumMenuOptions.student
        case UserTypes.teacher.rawValue:
            return NumMenuOptions.teacher
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
        
//        switch viewModel.userType {
//        case UserTypes.student.rawValue:
//            if row == 0 {
//                cell.titleLabel?.text = Localizable.Menu.registerAttendance
//            } else if row == 1 {
//                cell.titleLabel?.text = Localizable.Menu.checkAttendance
//            }
//        case UserTypes.teacher.rawValue:
//            if row == 0 {
//                cell.titleLabel?.text = Localizable.Menu.registerAttendance
//            } else if row == 1 {
//                cell.titleLabel?.text = Localizable.Menu.checkAttendance
//            } else if row == 2 {
//                cell.titleLabel?.text = Localizable.Menu.studentsAttendance
//            } else if row == 3 {
//                cell.titleLabel?.text = Localizable.Menu.sendToSIGAA
//            }
//        default:
//            return cell
//        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
//        switch viewModel.userType {
//        case UserTypes.student.rawValue:
//            switch row {
//            case 0:
//                self.navigationController?.pushViewController(registerAttendanceVC, animated: true)
//            case 1:
//                self.navigationController?.pushViewController(checkAttendanceVC, animated: true)
//            default:
//                break
//            }
//        case UserTypes.teacher.rawValue:
//            switch row {
//            case 0:
//                self.navigationController?.pushViewController(registerAttendanceVC, animated: true)
//            case 1:
//                self.navigationController?.pushViewController(checkAttendanceVC, animated: true)
//            case 2:
//                self.navigationController?.pushViewController(studentsAttendanceVC, animated: true)
//            case 3:
//                self.navigationController?.pushViewController(sendToSIGAAVC, animated: true)
//            default:
//                break
//            }
//        default:
//            break
//        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
