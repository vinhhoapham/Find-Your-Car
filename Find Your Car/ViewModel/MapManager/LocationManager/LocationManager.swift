//
//  LocationManager.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/15/22.
//

import Foundation
import MapKit




class LocationManager : NSObject, ObservableObject, CLLocationManagerDelegate {
    
    
    private(set) var manager : CLLocationManager = CLLocationManager()
    var currentLocation: CLLocation  {
        manager.location ?? LocationDefault.defaultLocation
    }
    
    override init() {
        super.init()
        setUpLocationManager()
    }
    func isCloseTo(location : CLLocation) -> Bool {
        currentLocation.distance(from: location) <= LocationDefault.reachDistance
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
    
    func verticalDirection(to location: CLLocation) -> VerticalDirection {
        let verticalDistance = location.altitude - currentLocation.altitude
        if abs(verticalDistance) <= LocationDefault.reachAltitude { return .same }
        return verticalDistance > 0 ? .higher : .lower
    }
    
    
    func setUpLocationManager() {
        manager.delegate = self
        manager.desiredAccuracy = .greatestFiniteMagnitude
        manager.startUpdatingLocation()
    }
    
    
    func requestLocationPermission() {
        manager.requestWhenInUseAuthorization()
    }
    
    func checkAuthorizationStatus() throws {
        
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
