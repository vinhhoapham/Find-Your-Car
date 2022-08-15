//
//  Map.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/29/22.
//

import Foundation
import SwiftUI
import MapKit

// TODO: Wrap this up
struct MainMap : UIViewRepresentable {
    
    class Coordinator : NSObject, MKMapViewDelegate {
        var parentView : MainMap
        init(mapView : MainMap) {
            parentView = mapView
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            guard annotation is MKPointAnnotation else {return nil}
            let identifier = "\(annotation.coordinate)-VechileAnnotation"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            
            if annotationView == nil {
                
                annotationView = MKMarkerAnnotationView(annotation: annotation,
                                                        reuseIdentifier: identifier)
                guard let annotatedVehicle = parentView.mapManger.findVehicle(with: annotation.coordinate) else {
                    return annotationView
                }
                
                annotationView = annotatedVehicle.annotationView(annotation: annotation,
                                                                 reuseIdentifier: identifier)
                
            } else {
                annotationView?.annotation = annotation
            }
            
            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            guard let viewAnnotation = view.annotation else {
                return
            }
            
            guard let annotatedVehicle = parentView.mapManger.findVehicle(with: viewAnnotation.coordinate) else {
                return
            }
            do {
                try parentView.mapManger.setFocusingVehicle(to: annotatedVehicle)
            } catch {
                return
            }
            
            guard let focusingVehicleLocation = parentView.mapManger.focusingVehicleLocation else {
                print("Couldn't load focusing vehicle's location")
                return
            }
            
            parentView.drawRouteFromUsersLocation(to: focusingVehicleLocation, on: mapView)
            
            
            
        }
        
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKGradientPolylineRenderer(overlay: overlay)
            renderer.strokeColor = UIColor(parentView.settings.colorPalette.accentColor)
            renderer.lineWidth = 5
            return renderer
        }
        
    }
    
    @EnvironmentObject var mapManger : MapManager
    @EnvironmentObject var settings : Settings
    
    typealias UIViewType = MKMapView
    
    func makeUIView(context: Context) -> MKMapView {
        let mkMapView = MKMapView()
        mkMapView.delegate = context.coordinator
        mkMapView.userTrackingMode = .followWithHeading
        mkMapView.showsTraffic = false
        return mkMapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        uiView.clear()
        let vehiclesLocation = mapManger.vehicleLocations
        for (vehicle, location) in vehiclesLocation {
            uiView.addAnnotation(vehicle.annotation(at: location))
        }
        
        uiView.animatedZoom(to: mapManger.mapCentersOnUserLocation())
        uiView.showsUserLocation = true
        if let focusingVehicleLocation = mapManger.focusingVehicleLocation {
            drawRouteFromUsersLocation(to: focusingVehicleLocation, on: uiView)
        }
    }
    
    
    
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(mapView: self)
    }
    
    func drawRouteFromUsersLocation(to location : CLLocation, on mapView: MKMapView) {
        let requestDirectionFromUsersLocationToDestination = mapManger.userLocation.getDirectionFromCurrent(
                                                             to: location)
        mapView.drawRoute(request: requestDirectionFromUsersLocationToDestination)
    }
    
    
    
}



