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
    
    var studentDisciplineVC = StudentDisciplineViewController()
    var lecturerDisciplineVC = LecturerDisciplineViewController()
    
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
        studentDisciplineVC = UIStoryboard.instantiateController(
            fromStoryboardNamed: StoryboardName.studentCheckAttendance.rawValue,
            usingControllerIdentifier: StoryboardIdentifier.studentDisciplineViewController.rawValue
        )
        lecturerDisciplineVC = UIStoryboard.instantiateController(
            fromStoryboardNamed: StoryboardName.lecturerCheckAttendance.rawValue,
            usingControllerIdentifier: StoryboardIdentifier.lecturerDisciplineViewController.rawValue
        )
    }
    
    // MARK: TableViewDelegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewModel.userType {
        case UserTypes.student.rawValue:
            return NumMenuOptions.student
        case UserTypes.lecturer.rawValue:
            return NumMenuOptions.lecturer
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
                cell.titleLabel?.text = Localizable.Menu.checkAttendance
            }
        case UserTypes.lecturer.rawValue:
            if row == 0 {
                cell.titleLabel?.text = Localizable.Menu.checkAttendance
            } else if row == 1 {
                cell.titleLabel?.text = Localizable.Menu.sendToSIGAA
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
                self.navigationController?.pushViewController(studentDisciplineVC, animated: true)
            default:
                break
            }
        case UserTypes.lecturer.rawValue:
            switch row {
            case 0:
                self.navigationController?.pushViewController(lecturerDisciplineVC, animated: true)
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
