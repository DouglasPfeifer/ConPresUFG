//
//  SideMenuViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 29/06/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import SideMenuSwift

class SideMenuViewController: BaseViewController {
    
    // MARK: Parameters
    
    @IBOutlet weak var tableView: UITableView!
    
    private let defaultSideMenuWidth: CGFloat = 260
    private let widthToDisableSwipe: CGFloat = -20
        
    var viewModel: SideMenuViewModel!
    
    private lazy var homeCoordinator = HomeCoordinator()
    
    var showFirstItem = PublishSubject<Void>()
    var showSecondItem = PublishSubject<Void>()
    
    // MARK: Lifecycle
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        setupSideMenu()
    }
    
    // MARK: Internal methods
    private func setupSideMenu() {
        
    }
    
    // MARK: Actions

    /// Displays the home controller when a notification is received, requesting to do so.
    @objc private func displayHomeController(_ notification: Notification? = nil) {
        sideMenuController?.setContentViewController(with: Menu.ScreenIdentifier.main.rawValue)
    }

    @objc private func displayFirstItem(_ notification: Notification? = nil) {
        showFirstItem.onNext(())
    }

    @objc private func displaySecondItem(_ notification: Notification? = nil) {
        showSecondItem.onNext(())
    }
    
    // MARK: Bindings

    private func setupBindings() {
        viewModel
            .options
            .bind(to: tableView.rx.items(
                cellIdentifier: SideMenuTableViewCell.identifier,
                cellType: SideMenuTableViewCell.self)
            ) { _, item, cell in
                cell.title = "asd"
                cell.selectedBackgroundView = UIView()
                cell.selectedBackgroundView?.backgroundColor = UIColor.white.withAlphaComponent(0.2)
            }.disposed(by: disposeBag)

        self.tableView
            .rx
            .itemSelected
            .subscribe(onNext: { [unowned self] indexPath in
                let cell = self.tableView.cellForRow(at: indexPath)
                cell?.setSelected(false, animated: true)
                self.segue(indexPath: indexPath)
        }).disposed(by: disposeBag)
    }
    
    // MARK: Imperatives

    private func segue(indexPath: IndexPath) {
        let option = self.viewModel.options.value[indexPath.row]

        switch option.identifier {
        case .main:
            sideMenuController?.hideMenu(animated: true, completion: nil)
            
        case .first:
            displayFirstItem()
            
        case .second:
            displaySecondItem()
        }

        sideMenuController?.hideMenu()
    }
}
