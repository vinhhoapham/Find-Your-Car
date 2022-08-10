//
//  MKMapView + AnimatedShowAnnotations.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/7/22.
//

import Foundation
import MapKit

extension MKMapView {
    func animatedShowAnnotations() {
        MKMapView.animate(withDuration: 1,
                          delay: 0,
                          usingSpringWithDamping: 0.8,
                          initialSpringVelocity: 5,
                          options: UIView.AnimationOptions.curveEaseIn) {
            self.showAnnotations(self.annotations, animated: true)
        }
    }
    
}
