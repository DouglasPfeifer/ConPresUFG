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
    
    @IBOutlet weak var registerAttendanceButton: LoadingButton!
    
    @IBOutlet weak var mapView: MKMapView!
    
    private var observer: NSObjectProtocol?
    
    var viewModel: StudentClassViewModel!
    
    let alertController = UIAlertController(title: "Permissão do GPS", message: "Vá aos ajustes e ative a permissão do GPS", preferredStyle: .alert)
    let settingsAction = UIAlertAction(title: "Ajustes", style: .default) { (_) -> Void in
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in })
        }
    }
    let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.checkGPSPermission()
        setupLayout()
        setupAlert()
        
        observer = NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: .main) { [weak self] notification in
            self?.viewModel.checkGPSPermission()
            self?.setupLayout()
        }
    }
    
    deinit {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
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
    
    // MARK: Alert
    private func setupAlert() {
        alertController.addAction(cancelAction)
        alertController.addAction(settingsAction)
    }
    
    // MARK: Actions
    @IBAction func activateGPS(_ sender: Any) {
        if !viewModel.GPSPermissionGranted {
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func registerAttendance(_ sender: Any) {
        registerAttendanceButton.showLoading()
        viewModel.sendAttendance {
            self.registerAttendanceButton.hideLoading()
        }
    }
}
