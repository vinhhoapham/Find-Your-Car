//
//  Vehicle+Annotation.swift
//  Find Your Car
//
//  Created by Vinh Pham on 7/31/22.
//

import Foundation
import MapKit

extension Vehicle {
    func annotation(at location: CLLocation) -> MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.coordinate = location.coordinate
        annotation.title = self.name
        return annotation
    }
}

