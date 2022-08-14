//
//  MapManager.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/22/22.
//
import MapKit


typealias VehicleLocations = [Vehicle : CLLocation]



/// Handle marking and unmarking of vehicle's locations
///
class MapManager: ObservableObject {
    
    
    enum MapManagerError : Error{
        case vehicleNotFound
    }
   
    @Published private(set) var vehicleLocations    : VehicleLocations
    @Published private(set) var userLocation        = LocationManager()
    @Published private(set) var focusingVehicle : Vehicle?
    
    
    private var geoCoder = CLGeocoder()
    
    var mapSpan : MKCoordinateSpan {
        
        guard vehicleLocations.count > 0 else {
            return MKCoordinateSpan(
                latitudeDelta: MapDefaults.lattitudeSpan,
                longitudeDelta: MapDefaults.longitudeSpan)
        }
        
        let currentLocation = userLocation.currentLocation
        var lattitudeValues = vehicleLocations.map { $0.value.coordinate.latitude}
        var longitudeValues = vehicleLocations.map { $0.value.coordinate.longitude}
        
        
        lattitudeValues.append(currentLocation.coordinate.latitude)
        longitudeValues.append(currentLocation.coordinate.longitude)
        
        // We have assured that vehicleLocation is not an empty dictionary
        // therefore, the lattitudeValues, longitudeValues are not empty arrays
        // so can we safely unwrap the maxes and minz of these two arrays
        let lattitudeSpan = lattitudeValues.max()! - lattitudeValues.min()!
        let longitudeSpan = longitudeValues.max()! - longitudeValues.min()!
        return MKCoordinateSpan(latitudeDelta: lattitudeSpan + MapDefaults.paddingSpan,
                                longitudeDelta: longitudeSpan + MapDefaults.paddingSpan)
    }

    var focusingVehicleLocation : CLLocation? {
        guard let focusingVehicle = focusingVehicle else {
            return nil
        }
        guard let vehicleLocation = vehicleLocations[focusingVehicle] else {
            return nil
        }
        
        return vehicleLocation
        
    }
    var focusingVehicleIsCloseToUsersLocation : Bool {
        guard let focusingVehicleLocation = focusingVehicleLocation else {
            return false
        }
        
        return userLocation.isCloseTo(location: focusingVehicleLocation)
    }
    
    init (vehicleLocations : [Vehicle : CLLocation], focusingVehicle  : Vehicle? = nil) {
        
        self.vehicleLocations = vehicleLocations
        self.focusingVehicle = focusingVehicle
    }
    
    convenience init (persitence : MapManagerPersistence) {
        self.init(vehicleLocations: VehicleLocations(vehicleCoordinates: persitence.vehiclesCoordinates),
                  focusingVehicle : persitence.focusingVehicle)
    }
    
    func mark(vehicle: Vehicle) {
        let currentUsersLocation = userLocation.currentLocation
        mark(vehicle: vehicle, at: currentUsersLocation)
    }
    
    func mark(vehicle : Vehicle, at location: CLLocation) {
        vehicleLocations[vehicle] = location
        // This is guarenteed to run since we just set
        try! self.setFocusingVehicle(to: vehicle)
    
    }
    
    
    func unmark(vehicle: Vehicle) {
        vehicleLocations.removeValue(forKey: vehicle)
    }
    func setFocusingVehicle(to vehicle: Vehicle) throws {
        guard vehicleLocations[vehicle] != nil else {
            throw MapManagerError.vehicleNotFound
        }
        self.focusingVehicle = vehicle
    }
    
    func mapRegionCenter(at location: CLLocation) -> MKCoordinateRegion {
        MKCoordinateRegion(center: location.coordinate, span: mapSpan)
    }
    
    func mapCentersOnUserLocation() -> MKCoordinateRegion {
        mapRegionCenter(at: userLocation.currentLocation)
    }
    
    func requestUsersLocationAccess() {
        do {
            try userLocation.checkAuthorizationStatus()
        } catch LocationError.permissionUndetermined {
            userLocation.requestLocationPermission()
        } catch LocationError.permissionDenied, LocationError.permissionRestricted {
            // TODO: Alert here
        } catch {
            userLocation.requestLocationPermission()
        }
        
    }
    
    func unmarkFocusingVehicle() throws {
        guard let focusingVehicle = self.focusingVehicle else {
            throw MapManagerError.vehicleNotFound
        }
        unmark(vehicle: focusingVehicle)
        self.focusingVehicle = nil
    }
    
    func triggerUpdate() {
        objectWillChange.send()
    }
    
    func getPlacemark(of location: CLLocation,
                      completionHandler : @escaping (CLPlacemark?) -> Void) {
        
        geoCoder.reverseGeocodeLocation(location) { (placemark, error) in
            if let error = error {
               print(error)
            } else {
                guard let placemark = placemark else {
                    print("Fail to get the placemark of \(location)")
                    return
                }
                
                completionHandler(placemark.first)
            }
        }
        
    }
    
    
}

