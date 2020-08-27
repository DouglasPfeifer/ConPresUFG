//
//  AddSelectedClassViewController.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 27/08/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import UIKit
import MapKit

class AddSelectedClassViewController: UIViewController, CLLocationManagerDelegate {

    // MARK: Variables
    @IBOutlet weak var disciplineTitleLabel: UILabel!
    @IBOutlet weak var classDateLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var startClassButton: UIButton!
    @IBOutlet weak var endClassButton: UIButton!
    @IBOutlet weak var classPasswordLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var viewModel: AddSelectedClassViewModel!

    var activeClass: Class?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = AddSelectedClassViewModel()
        viewModel.askForGPSPermission()

        disciplineTitleLabel.text = activeClass?.discipline ?? "---"
        classDateLabel.text = activeClass?.startDate ?? "--/--/----"
        startTimeLabel.text = activeClass?.startTime ?? "--:--"
        endTimeLabel.text = activeClass?.endTime ?? "--:--"
        classPasswordLabel.text = activeClass?.password ?? "Inicie a aula para gerar uma senha"
        mapView.camera.centerCoordinate = CLLocationCoordinate2D(latitude: activeClass?.latitude ?? 0, longitude: activeClass?.longitude ?? 0)
    }
    
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
            mapView.camera.centerCoordinate = CLLocationCoordinate2D(latitude: locValue.latitude, longitude: locValue.longitude)
        }

    
    // MARK: Actions
    @IBAction func startClassAction(_ sender: Any) {
        activeClass?.latitude = viewModel.getLocation()[0]
        activeClass?.longitude = viewModel.getLocation()[1]
        viewModel.getDeviceID()
    }
    
    @IBAction func endClassAction(_ sender: Any) {
        activeClass?.latitude = viewModel.getLocation()[0]
        activeClass?.longitude = viewModel.getLocation()[1]
        viewModel.getDeviceID()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
