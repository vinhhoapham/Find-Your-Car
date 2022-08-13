//
//  Tag+annotationView.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/7/22.
//

import Foundation
import MapKit

extension Tag {
    func annotationView(annotation: MKAnnotation,
                        resuseIdentifier: String)
    -> MKAnnotationView {
        
        var annotationView : MKAnnotationView = MKAnnotationView(annotation: annotation,
                                                                   reuseIdentifier: resuseIdentifier)
        
        switch self.type {
                
            case .defaultTag:
                annotationView =  MKMarkerAnnotationView(annotation: annotation,
                                                          reuseIdentifier: resuseIdentifier)
            case .emoji:

                do {
                    let emoji = try self.getEmoji()
                    annotationView.image = emoji.UImage()
                    
                } catch {
                    print("couldn't load emoji")
                }
                
        }
        
    return annotationView
    }
    

}
