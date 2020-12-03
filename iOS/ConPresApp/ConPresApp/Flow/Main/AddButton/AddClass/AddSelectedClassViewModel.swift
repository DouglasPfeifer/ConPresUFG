//
//  AddSelectedClassViewModel.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 27/08/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit
import Moya

class AddSelectedClassViewModel: BaseViewModel, CLLocationManagerDelegate {
    
    // MARK: Properties
    let locationManager = CLLocationManager()
    
    // MARK: GPS Location Delegate
    func askForGPSPermission() {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
                case .notDetermined, .restricted, .denied:
                    print("No access")
                case .authorizedAlways, .authorizedWhenInUse:
                    print("Access")
                @unknown default:
                break
            }
            } else {
                print("Location services are not enabled")
        }
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()

        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
//        print("locations = \(locValue.latitude) \(locValue.longitude)")
//    }
    
    // MARK: Internal methods
    func getLocation() -> [Double] {
        guard let location = locationManager.location else { return [0.0, 0.0] }
        return [location.coordinate.latitude, location.coordinate.longitude]
    }
    
    func getDeviceID() {
        let uuid = getUUID()
        print("UUID: \(uuid)")
    }
    
    // MARK: Attendance
    func registerAttendance() {
        getDeviceID()
    }
    
    // MARK: Request
    func genericRequestExample() {
        let provider = MoyaProvider<NetworkingService>()
        provider.request(.createUser(firstName: "James", lastName: "Potter")) { result in
            // do something with the result (read on for more details)
        }

        // The full request will result to the following:
        // POST https://api.myservice.com/users
        // Request body:
        // {
        //   "first_name": "James",
        //   "last_name": "Potter"
        // }

        provider.request(.updateUser(id: 123, firstName: "Harry", lastName: "Potter")) { result in
            // do something with the result (read on for more details)
        }

        // The full request will result to the following:
        // POST https://api.myservice.com/users/123?first_name=Harry&last_name=Potter
    }
}