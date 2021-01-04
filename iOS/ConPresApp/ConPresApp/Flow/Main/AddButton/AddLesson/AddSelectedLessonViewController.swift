//
//  AddSelectedLessonViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 27/08/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit
import MapKit

class AddSelectedLessonViewController: BaseViewController, CLLocationManagerDelegate {

    // MARK: Properties
    @IBOutlet weak var disciplineTitleLabel: UILabel!
    @IBOutlet weak var lessonDateLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var startLessonButton: UIButton!
    @IBOutlet weak var lessonPasswordLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    private var observer: NSObjectProtocol?

    var viewModel: AddSelectedLessonViewModel!

    var activeLesson: Lesson?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = AddSelectedLessonViewModel()

        viewModel.checkGPSPermission()

        setupLayout()
        setupMapView()
        
        observer = NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: .main) { [weak self]
            notification in
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
    private func setupLayout() {
        // Start MOCK
        lessonDateLabel.text = "Quinta-Feira - 24/12/2020"
        startTimeLabel.text = "08:00"
        endTimeLabel.text = "09:40"
        lessonPasswordLabel.text = "frN5a!pt-Ce0"

        // End MOCK
        
        disciplineTitleLabel.text = activeLesson?.discipline ?? "---"
//        lessonDateLabel.text = activeLesson?.startTime?.convertToDate().getDayMonthYear() ?? "--/--/----"
//        startTimeLabel.text = activeLesson?.startTime?.convertToDate().getHourMinutes() ?? "--:--"
//        endTimeLabel.text = activeLesson?.endTime?.convertToDate().getHourMinutes() ?? "--:--"
//        lessonPasswordLabel.text = activeLesson?.password ?? "Inicie a aula para gerar uma senha"
    }
    
    private func setupMapView() {
        let currentRegion = viewModel.getCurrentRegion(regionRadius: 100)
        mapView.setRegion(currentRegion, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        mapView.camera.centerCoordinate = CLLocationCoordinate2D(latitude: locValue.latitude, longitude: locValue.longitude)
    }
    
    // MARK: Actions
    @IBAction func startLessonAction(_ sender: Any) {
//        activeLesson?.latitude = viewModel.getLocation()[0]
//        activeLesson?.longitude = viewModel.getLocation()[1]
//        viewModel.getDeviceID()
    }
}
