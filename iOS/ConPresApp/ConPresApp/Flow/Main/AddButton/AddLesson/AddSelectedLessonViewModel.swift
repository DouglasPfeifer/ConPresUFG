//
//  AddSelectedLessonViewModel.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 27/08/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit
import Moya

class AddSelectedLessonViewModel: BaseViewModel, CLLocationManagerDelegate {
    
    // MARK: Properties
    let locationManager = CLLocationManager()
    private let defaultLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -16.60345745122536, longitude: -49.266678763718126),
                                                     latitudinalMeters: 100,
                                                     longitudinalMeters: 100)
    var currentLocation: CLLocation?
    var deviceID: String?
    var GPSPermissionGranted = false
    
    // MARK: Initializer
    override init() {
        super.init()
        setCurrentLocation()
        setDeviceID()
    }
    
    // MARK: GPS Location Delegate
    func checkGPSPermission() {
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
    
    func getCurrentRegion (regionRadius: CLLocationDistance = 100) -> MKCoordinateRegion {
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
}
