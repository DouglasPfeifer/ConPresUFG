//
//  StudentClassViewModel.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 01/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import CoreLocation
import MapKit
import Moya

class StudentClassViewModel: BaseViewModel, CLLocationManagerDelegate {
    
    // MARK: Properties
    let locationManager = CLLocationManager()
    private let defaultLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -16.60345745122536, longitude: -49.266678763718126),
                                                     latitudinalMeters: 1000,
                                                     longitudinalMeters: 1000)
    var currentLocation: CLLocation?
    var deviceID: String?
    var GPSPermissionGranted = false
    
    var currentClass: Class!
    
    // MARK: Initializer
    init(currentClass: Class) {
        super.init()
        self.currentClass = currentClass
        setCurrentLocation()
        setDeviceID()
    }
    
    // MARK: GPS Location Delegate
    func askForGPSPermission() {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
                case .notDetermined, .restricted, .denied:
                    // No access
                    GPSPermissionGranted = false
                case .authorizedAlways, .authorizedWhenInUse:
                    // Access
                    GPSPermissionGranted = true
                @unknown default:
                break
            }
        } else {
            // Location services are not enabled
            GPSPermissionGranted = false
        }
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()

        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            setCurrentLocation()
        }
    }
    
    func setCurrentLocation() {
        currentLocation = locationManager.location
    }
    
    func getCurrentRegion (regionRadius: CLLocationDistance = 1000) -> MKCoordinateRegion {
        setCurrentLocation()
        guard let currentLocation = currentLocation else {
            return defaultLocation
        }
        let currentCoordinateRegion = MKCoordinateRegion(center: currentLocation.coordinate,
                                                         latitudinalMeters: regionRadius,
                                                         longitudinalMeters: regionRadius)
        return currentCoordinateRegion
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
//        print("locations = \(locValue.latitude) \(locValue.longitude)")
//    }
    
    // MARK: UUID Methods
    func setDeviceID() {
        deviceID = getUUID()
    }
    
    // MARK: HTTP Requests
    func sendAttendance() {
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
