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
    
    // MARK: Variables
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: HomeViewModel!
    
    var userType: Int?
        
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userType = UserDefaults.UserType
        viewModel = HomeViewModel()
        
        setupSideMenu()
        updateMenu()
        setupTableView()
    }
    
    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sideMenuNavigationController = segue.destination as? SideMenuNavigationController else { return }
        sideMenuNavigationController.settings = makeSettings()
    }
    
    // MARK: Internal methods
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
}

// MARK: TableView Delegate

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let dayOfTheWeek = viewModel.getDayOfTheWeek(weekDay: section)
        return "\(dayOfTheWeek)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
            
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardIdentifier.homeCell.rawValue, for: indexPath) as! HomeTableViewCell

        cell.courseLabel.text = "Engenharia de Requisitos"
        cell.lecturerLabel.text = "Juliano Lopes de Oliveira"
        cell.locationLabel.text = "152, INF, CAS"
        cell.scheduleLabel.text = "14:00 às 15:40"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
                
        if userType == 0 {
            self.performSegue(withIdentifier: StoryboardIdentifier.showAskStudentClassPasswordSegue.rawValue, sender: nil)
        } else if userType == 1 {
            self.performSegue(withIdentifier: StoryboardIdentifier.showTeacherClassSegue.rawValue, sender: nil)
        }
    }
}
