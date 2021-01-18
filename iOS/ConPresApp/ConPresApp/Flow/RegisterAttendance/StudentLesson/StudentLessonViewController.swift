//
//  StudentLessonViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 01/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit
import MapKit

class StudentLessonViewController: BaseViewController {

    // MARK: Properties
    @IBOutlet weak var scrollView: UIScrollView!
    
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
    
    let refreshControl = UIRefreshControl()

    private var observer: NSObjectProtocol?
    
    var viewModel: StudentLessonViewModel!
    
    var isRequesting: Bool = false
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl.addTarget(self, action: #selector(updateView), for: .valueChanged)
        scrollView.refreshControl = refreshControl
        
        viewModel.checkGPSPermission()
        setupLayout()
        
        getLesson()
        
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
        setupLessonViews()
        setupAttendanceViews()
        setupMapView()
    }
    
    private func setupLessonViews() {
        // Start MOCK
//        disciplineLabel.text = "Engenharia de Requisitos"
//        lecturerLabel.text = "Juliano Lopes de Oliveira"
//        classroomLabel.text = "Campus Samambaia - CAB 201"
//        scheduleLabel.text = "08:00 às 9:40"
        // End MOCK
        
        disciplineLabel.text = viewModel.currentLesson.discipline
        lecturerLabel.text = viewModel.currentLesson.lecturer
        classroomLabel.text = String(describing: viewModel.currentLesson.classroom!)
        scheduleLabel.text = viewModel.getLessonTimeInterval()
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
        registerAttendanceButton.isEnabled = true
    }
    
    private func setupMapView() {
        let currentRegion = viewModel.getCurrentRegion(regionRadius: 100)
        mapView.setRegion(currentRegion, animated: true)
    }
    
    // MARK: Methods
    func getLesson() {
        if !isRequesting {
            isRequesting = true
            viewModel.getUserLesson {
                (success) in
                if success {
                    self.isRequesting = false
                    DispatchQueue.main.async {
                        self.registerAttendanceButton.isEnabled = true
                    }
                } else {
                    DispatchQueue.main.async {
                        self.registerAttendanceButton.isEnabled = false
                    }
                    let requestFailureAlert = UIAlertController(title: "Network error", message: "Não foi possível receber os dados da aula, tente novamente.", preferredStyle: .alert)
                    let tryAgainAction = UIAlertAction(title: "Tentar novamente", style: .default, handler: {
                        _ in
                        self.getLesson()
                    })
                    let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
                    requestFailureAlert.addAction(tryAgainAction)
                    requestFailureAlert.addAction(cancelAction)
                    if self.isRequesting {
                        self.present(requestFailureAlert, animated: true)
                    }
                    self.isRequesting = false
                }
            }
        }
    }
        
    // MARK: Actions
    @objc func updateView(refreshControl: UIRefreshControl) {
        getLesson()
        refreshControl.endRefreshing()
    }
    
    @IBAction func activateGPS(_ sender: Any) {
        let gpsAlertController = UIAlertController(title: "Permissão do GPS", message: "Vá aos ajustes e ative a permissão do GPS.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let settingsAction = UIAlertAction(title: "Ajustes", style: .default) { (_) -> Void in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in })
            }
        }
        gpsAlertController.addAction(cancelAction)
        gpsAlertController.addAction(settingsAction)
        if !viewModel.GPSPermissionGranted {
            present(gpsAlertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func registerAttendance(_ sender: Any) {
        registerAttendanceButton.showLoading()
        let invalidPasswrodAlertController = UIAlertController(title: "Senha inválida", message: "A senha inserida não é válida, tente novamente.", preferredStyle: .alert)
        let attendanceNotSentAlertController = UIAlertController(title: "Ocorreu um erro", message: "Não foi possível enviar sua presença, tente novamente.", preferredStyle: .alert)
        let attendanceSentAlertController = UIAlertController(title: "Presença enviada", message: "Sua presença foi enviada com sucesso.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        guard let insertedPassword = passwordTextField.text else {
            invalidPasswrodAlertController.addAction(okAction)
            present(invalidPasswrodAlertController, animated: true, completion: {
                self.registerAttendanceButton.hideLoading()
            })
            return
        }
        if viewModel.validLessonPassword(lessonPassword: insertedPassword) {
            
            registerAttendanceButton.hideLoading()
            attendanceSentAlertController.addAction(okAction)
            present(attendanceSentAlertController, animated: true, completion: nil)
            viewModel.registerAttendance()
            
//            viewModel.getUserLesson {
//                success in
//                self.registerAttendanceButton.hideLoading()
//                if success {
//                    attendanceSentAlertController.addAction(okAction)
//                    self.present(attendanceSentAlertController, animated: true, completion: nil)
//                } else {
//                    attendanceNotSentAlertController.addAction(okAction)
//                    self.present(attendanceNotSentAlertController, animated: true, completion: nil)
//                }
//            }
        } else {
            invalidPasswrodAlertController.addAction(okAction)
            present(invalidPasswrodAlertController, animated: true, completion: {
                self.registerAttendanceButton.hideLoading()
            })
        }
    }
}
