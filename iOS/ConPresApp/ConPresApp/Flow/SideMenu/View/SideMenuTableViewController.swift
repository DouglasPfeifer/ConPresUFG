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
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    // MARK: TableViewDelegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardIdentifier.sideMenuCell.rawValue, for: indexPath) as! SideMenuTableViewCell
        let row = indexPath.row
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .gray
        cell.selectedBackgroundView = backgroundView
        
        if row == 0 {
            cell.titleLabel?.text = "Preferences"
        } else if row == 1 {
            cell.titleLabel?.text = "Scroll View and Others"
        } else if row == 2 {
            cell.titleLabel?.text = "IB / Code"
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
