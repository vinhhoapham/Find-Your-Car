//
//  MKMapView + ClearMap.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/4/22.
//

import Foundation
import MapKit

extension MKMapView {
    func clear() {
        self.removeAnnotations(self.annotations)
        self.removeOverlays(self.overlays)
    }
}
