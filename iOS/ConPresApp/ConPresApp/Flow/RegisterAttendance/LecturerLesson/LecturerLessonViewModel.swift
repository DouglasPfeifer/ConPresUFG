//
//  LecturerLessonViewModel.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 20/12/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class LecturerLessonViewModel: BaseViewModel, CLLocationManagerDelegate {
    
    // MARK: Properties
    let locationManager = CLLocationManager()
    private let defaultLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -16.60345745122536, longitude: -49.266678763718126),
                                                     latitudinalMeters: 100,
                                                     longitudinalMeters: 100)
    var currentLocation: CLLocation?
    var deviceID: String?
    var GPSPermissionGranted = false
    
    var currentLesson: Lesson!
    var lessons: [Lesson]?
    
    // MARK: Initializer
    init(selectedLesson: Lesson) {
        super.init()
        self.currentLesson = selectedLesson
        if let lessonsArray = UserDefaults.standard.data(forKey: "lecturerLessonsArray") {
            do {
                lessons = try JSONDecoder().decode([Lesson].self, from: lessonsArray)
            } catch {
                print("asd erro")
            }
        }
        setCurrentLocation()
    }
    
    // MARK: Attendance
    func getNumberOfAttendants() -> Int {
        var attendants = 0
        for student in currentLesson.lecturerStudents! {
            if student.attendance! {
                attendants += 1
            }
        }
        return attendants
    }
    
    func getNumberOfAbsences() -> Int {
        var absents = 0
        for student in currentLesson.lecturerStudents! {
            if !student.attendance! {
                absents += 1
            }
        }
        return absents
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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    func endLesson() {
        currentLesson.attendance = 1
        let index = lessons?.firstIndex(where: {$0.id == currentLesson.id})
        lessons![index!] = currentLesson
        do {
            let lessonsArray = try JSONEncoder().encode(lessons)
            UserDefaults.standard.set(lessonsArray, forKey: "lecturerLessonsArray")
        } catch {
            print("asd erro")
        }
    }
}
