//
//  LecturerLessonViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 20/12/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit
import MapKit

class LecturerLessonViewController: BaseViewController, CLLocationManagerDelegate {

    // MARK: Properties
    @IBOutlet weak var disciplineNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var classroomLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var attendedStudentsLabel: UILabel!
    @IBOutlet weak var absentStudentsLabel: UILabel!
    @IBOutlet weak var verifyAttendanceButton: UIButton!
    @IBOutlet weak var endLessonButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    private var observer: NSObjectProtocol?
    
    var viewModel: LecturerLessonViewModel!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Aula"
        
        viewModel.checkGPSPermission()
        
        setupLabels()
        setupMapView()
        
        observer = NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: .main) { [weak self] notification in
            self?.viewModel.checkGPSPermission()
            self?.setupMapView()
        }
    }
    
    deinit {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    // MARK: Internal methods
    private func setupLabels() {
        // Start MOCK
//        disciplineNameLabel.text = "Engenharia de Requisitos"
//        dateLabel.text = viewModel.currentLesson.startTime?.convertToDate().getDayMonthYear()
//        classroomLabel.text = String(describing: viewModel.currentLesson.classroom!)
//        startTimeLabel.text = viewModel.currentLesson.startTime?.convertToDate().getHourMinutes()
//        endTimeLabel.text = viewModel.currentLesson.endTime?.convertToDate().getHourMinutes()
//        passwordLabel.text = viewModel.currentLesson.password
//        attendedStudentsLabel.text = "25"
//        absentStudentsLabel.text = "15"
        // End MOCK
        
        disciplineNameLabel.text = viewModel.currentLesson.discipline
        dateLabel.text = viewModel.currentLesson.startTime?.convertToDate().getDayMonthYear()
        classroomLabel.text = String(describing: viewModel.currentLesson.classroom!)
        startTimeLabel.text = viewModel.currentLesson.startTime?.convertToDate().getHourMinutes()
        endTimeLabel.text = viewModel.currentLesson.endTime?.convertToDate().getHourMinutes()
        passwordLabel.text = viewModel.currentLesson.password
        attendedStudentsLabel.text = "\(viewModel.getNumberOfAttendants())"
        absentStudentsLabel.text = "\(viewModel.getNumberOfAbsences())"
    }
    
    private func setupMapView() {
        let currentRegion = viewModel.getCurrentRegion(regionRadius: 100)
        mapView.setRegion(currentRegion, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        mapView.camera.centerCoordinate = CLLocationCoordinate2D(latitude: locValue.latitude, longitude: locValue.longitude)
    }
    
    @IBAction func endLesson(_ sender: Any) {
        endLessonButton.isEnabled = false
        endLessonButton.backgroundColor = UIColor.systemGray
        viewModel.endLesson()
    }
}
