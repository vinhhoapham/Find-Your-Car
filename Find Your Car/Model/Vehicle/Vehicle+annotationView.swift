//
//  Vehicle+annotationView.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/7/22.
//

import Foundation
import MapKit

extension Vehicle {
    func annotationView(annotation: MKAnnotation, reuseIdentifier : String) -> MKAnnotationView {
        self.tag.annotationView(annotation: annotation, resuseIdentifier: reuseIdentifier)
    }
}
