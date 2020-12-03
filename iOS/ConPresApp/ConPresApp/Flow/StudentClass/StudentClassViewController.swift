//
//  StudentClassViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 01/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit
import MapKit

class StudentClassViewController: BaseViewController {

    // MARK: Properties
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var disciplineLabel: UILabel!
    @IBOutlet weak var lecturerLabel: UILabel!
    @IBOutlet weak var classroomLabel: UILabel!
    @IBOutlet weak var scheduleLabel: UILabel!
    
    @IBOutlet weak var askGPSPermissionButton: UIButton!
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerAttendanceButton: UIButton!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var viewModel: StudentClassViewModel!

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.askForGPSPermission()
        
        setupLayout()
    }
    
    // MARK: Layout functions
    private func setupLayout() {
        setupClassViews()
        setupAttendanceViews()
        setupMapView()
    }
    
    private func setupClassViews() {
        disciplineLabel.text = viewModel.currentClass.discipline
        lecturerLabel.text = viewModel.currentClass.lecturer
        classroomLabel.text = viewModel.currentClass.classroom
        scheduleLabel.text = viewModel.currentClass.schedule
    }
    
    private func setupAttendanceViews() {
        if viewModel.GPSPermissionGranted {
            askGPSPermissionButton.isEnabled = false
            askGPSPermissionButton.setTitle("GPS ativado", for: .normal)
            askGPSPermissionButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
            askGPSPermissionButton.backgroundColor = UIColor.systemGray
            askGPSPermissionButton.layer.cornerRadius = askGPSPermissionButton.frame.height/2
            askGPSPermissionButton.tintColor = UIColor.white
        } else {
            askGPSPermissionButton.isEnabled = true
            askGPSPermissionButton.setTitle("Permitir o uso do GPS", for: .normal)
            askGPSPermissionButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
            askGPSPermissionButton.backgroundColor = UIColor.systemBlue
            askGPSPermissionButton.layer.cornerRadius = askGPSPermissionButton.frame.height/2
            askGPSPermissionButton.tintColor = UIColor.white
        }
        
        passwordLabel.text = "Insira a senha da aula"
        passwordTextField.placeholder = "Senha fornecida pelo professor"
        
        registerAttendanceButton.setTitle("Enviar presença", for: .normal)
        registerAttendanceButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        registerAttendanceButton.backgroundColor = UIColor.systemBlue
        registerAttendanceButton.layer.cornerRadius = registerAttendanceButton.frame.height/2
        registerAttendanceButton.tintColor = UIColor.white
    }
    
    private func setupMapView() {
        let currentRegion = viewModel.getCurrentRegion(regionRadius: 1000)
        mapView.setRegion(currentRegion, animated: true)
    }
    
    @IBAction func activateGPS(_ sender: Any) {
        viewModel.askForGPSPermission()
    }
    
    @IBAction func registerAttendance(_ sender: Any) {
        
    }
}
