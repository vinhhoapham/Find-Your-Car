//
//  MKMapView+AnimatedZoom.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/5/22.
//

import Foundation
import MapKit

extension MKMapView {
    func animatedZoom(to region: MKCoordinateRegion) {
        MKMapView.animate(withDuration: 1,
                          delay: 0,
                          usingSpringWithDamping: 0.8,
                          initialSpringVelocity: 5,
                          options: UIView.AnimationOptions.curveEaseIn)
            {
                self.setRegion(region, animated: true)
            }
    }
}
