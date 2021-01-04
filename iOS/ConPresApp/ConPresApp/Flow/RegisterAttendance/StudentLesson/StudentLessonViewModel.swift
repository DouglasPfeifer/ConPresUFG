//
//  StudentLessonViewModel.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 01/07/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import CoreLocation
import MapKit
import Moya

class StudentLessonViewModel: BaseViewModel, CLLocationManagerDelegate {
    
    // MARK: Properties
    let locationManager = CLLocationManager()
    private let defaultLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -16.60345745122536, longitude: -49.266678763718126),
                                                     latitudinalMeters: 100,
                                                     longitudinalMeters: 100)
    var currentLocation: CLLocation?
    var deviceID: String?
    var GPSPermissionGranted = false
    
    var currentLesson: Lesson!
        
    // MARK: Initializer
    init(selectedLesson: Lesson) {
        super.init()
                
        self.currentLesson = selectedLesson
        setCurrentLocation()
        setDeviceID()
    }
    
    // MARK: Internal Methods
    func getLessonTimeInterval() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        guard let startTime = currentLesson.startTime else { return "--:-- às --:--" }
        let startTimeString = dateFormatter.string(from: startTime.convertToDate())
        
        guard let endTime = currentLesson.endTime else { return "\(startTimeString) às --:--" }
        let endTimeString = dateFormatter.string(from: endTime.convertToDate())
        
        let timeInterval = "\(startTimeString) às \(endTimeString)"
        return timeInterval
    }
    
    func validLessonPassword(lessonPassword: String) -> Bool {
         return currentLesson.password == lessonPassword
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
    
    // MARK: HTTP Requests
    func getUserLesson(completion: @escaping (Bool) -> ()) {
        let id = 1
        networkManager.getUserLesson(userID: id, completion: {
            (lesson, error) in
            dump(lesson)
            if let error = error {
                completion(false)
                return
            }
            self.currentLesson.disciplineID = lesson?.disciplineID
            self.currentLesson.classroomID = lesson?.classroomID
            self.currentLesson.attendance = lesson?.attendance
            completion(true)
        })
    }
}
