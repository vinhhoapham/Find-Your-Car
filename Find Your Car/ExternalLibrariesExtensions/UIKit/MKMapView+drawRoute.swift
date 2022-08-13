//
//  MKMapView+drawRoute.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/3/22.
//

import Foundation
import MapKit


extension MKMapView {
    func drawRoute(request: MKDirections) {
        DispatchQueue.main.async {
            request.calculate { response,error in
                guard let directionResponse = response else {
                    print(error.debugDescription)
                    return
                }
                
                for route in directionResponse.routes {
                    self.addOverlay(route.polyline)
                }
            }
        }
    }
    
}
