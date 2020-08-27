//
//  AddClassViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 16/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation
import UIKit

class AddClassViewController: BaseViewController {
    
    let data = [
        "Engenharia de requisitos": [["date": "20/09/2020", "startTime": "14:00", "endTime": "15:40"], ["date": "22/09/2020", "startTime": "16:00", "endTime": "17:40"], ["date": "24/09/2020", "startTime": "18:00", "endTime": "19:40"]],
        "Teoria da computação": [["date": "20/09/2020", "startTime": "11:00", "endTime": "12:40"], ["date": "24/09/2020", "startTime": "13:00", "endTime": "14:40"],["date": "28/09/2020", "startTime": "14:00", "endTime": "15:40"]],
        "Redes de computadores 2": [["date": "10/09/2020", "startTime": "09:00", "endTime": "10:40"], ["date": "11/09/2020", "startTime": "11:00", "endTime": "12:40"], ["date": "12/09/2020", "startTime": "13:00", "endTime": "14:40"]]]
    
    // MARK: Variables
    @IBOutlet weak var disciplinesSegmentedControl: UISegmentedControl!
    @IBOutlet weak var disciplineTitleLabel: UILabel!
    @IBOutlet weak var classesTableView: UITableView!
    
    private var activeTableViewArray: [[String: String]] = [[:]]
    
    private var selectedIndex: Int?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupSegmentedControl()
    }
    
    // MARK: Internal methods
    func setupSegmentedControl() {
        disciplinesSegmentedControl.removeAllSegments()
        for segment in data {
            disciplinesSegmentedControl.insertSegment(withTitle: segment.key, at: disciplinesSegmentedControl.numberOfSegments, animated: false)
        }
        disciplinesSegmentedControl.selectedSegmentIndex = 0
        disciplinesSegmentedControl.addTarget(self, action: #selector(segmentSelected), for: .valueChanged)
        segmentSelected(segment: disciplinesSegmentedControl)
    }
    
    @objc func segmentSelected(segment: UISegmentedControl) {
        guard let dictKey = segment.titleForSegment(at: segment.selectedSegmentIndex.self),
              let activeArray = data[dictKey] else { return }
        disciplineTitleLabel.text = dictKey
        activeTableViewArray = activeArray
        classesTableView.reloadData()
    }
    
    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case StoryboardIdentifier.showAddSelectedClassSegue.rawValue:
            let addSelectedClassViewController = segue.destination as! AddSelectedClassViewController
            guard let selectedCell = self.classesTableView.cellForRow(at: IndexPath(row: selectedIndex!, section: 0)) as? AddClassTableViewCell else { return }
            addSelectedClassViewController.activeClass = selectedCell.cellClass
        default:
            return
        }
    }
}

// MARK: TableView Delegate
extension AddClassViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedIndex = indexPath.row
        performSegue(withIdentifier: StoryboardIdentifier.showAddSelectedClassSegue.rawValue, sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activeTableViewArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardIdentifier.addClassCell.rawValue, for: indexPath) as! AddClassTableViewCell
        cell.cellClass = Class(discipline: disciplineTitleLabel.text!, startDate: activeTableViewArray[indexPath.row]["date"]!, startTime: activeTableViewArray[indexPath.row]["startTime"]!, endTime: activeTableViewArray[indexPath.row]["endTime"]!, password: nil, latitude: nil, longitude: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 107
    }
    
    func setupTableView() {
        classesTableView.delegate = self
        classesTableView.dataSource = self
    }
}
