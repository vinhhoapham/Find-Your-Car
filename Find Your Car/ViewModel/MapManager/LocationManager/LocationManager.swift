//
//  LocationManager.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/15/22.
//

import Foundation
import MapKit

enum LocationDefault {
    static let reachDistance       = 150.0
    static let defaultLocation     = CLLocation(latitude: 0, longitude: 0)
}


class LocationManager : NSObject, ObservableObject, CLLocationManagerDelegate {
    
    
    private(set) var manager : CLLocationManager = CLLocationManager()
    @Published private(set) var currentLocation: CLLocation = LocationDefault.defaultLocation
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = .greatestFiniteMagnitude
        manager.startUpdatingLocation()
        print("This got called INIT")
    }
    func isCloseTo(location : CLLocation) -> Bool {
        return currentLocation.distance(from: location) <= LocationDefault.reachDistance
    }
    
    func getDirectionFromCurrent(to location: CLLocation) ->  MKDirections {
        let requestDirectionToVehicle = getRequestFromCurrentLocation(to: location)
        return MKDirections(request: requestDirectionToVehicle)
    }
    
    /// Creat a request for MapKit to generate a direction
    /// from user's current location to the desire location
    ///
    func getRequestFromCurrentLocation(to location: CLLocation) -> MKDirections.Request {
        let currentLocationPlaceMark     = MKPlacemark(coordinate: currentLocation.coordinate)
        let vehicleLocationPlaceMark     = MKPlacemark(coordinate: location.coordinate)
        let requestDestinationToVehicle  = MKDirections.Request()
        
        requestDestinationToVehicle.source      = MKMapItem(placemark: currentLocationPlaceMark)
        requestDestinationToVehicle.destination = MKMapItem(placemark: vehicleLocationPlaceMark)
        requestDestinationToVehicle.transportType           = .walking
        requestDestinationToVehicle.requestsAlternateRoutes = true
        
        return requestDestinationToVehicle
    }
    
    func checkIfLocationServiceEnabled() throws {
        
        if CLLocationManager.locationServicesEnabled() {
            manager = CLLocationManager()
            manager.delegate = self
            manager.desiredAccuracy = .greatestFiniteMagnitude
            manager.startUpdatingLocation()
        } else {
            print("Failed")
            throw LocationError.managerNotInitialzed
        }
        
    }
    
    func requestLocationPermission() {
        manager.requestWhenInUseAuthorization()
    }
    
    private func checkAuthorizationStatus() throws {
        
        switch manager.authorizationStatus {
            case .notDetermined:
                throw LocationError.permissionUndetermined
            case .restricted:
                throw LocationError.permissionRestricted
            case .denied:
                throw LocationError.permissionDenied
            case .authorizedAlways, .authorizedWhenInUse:
                break
            @unknown default:
                break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("Updated")
        guard let latestLocation = locations.last else {
            print("Couldn't update your location")
            return
        }
        
        DispatchQueue.main.async {
            self.currentLocation = latestLocation
        }
        
                
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        // TODO: Handling Catch Errors
        do {
            try checkAuthorizationStatus()
        } catch LocationError.permissionRestricted {
            
        } catch LocationError.permissionDenied {
            
        } catch LocationError.permissionUndetermined {
            requestLocationPermission()
        } catch {
            
        }
    }
    
    
}
