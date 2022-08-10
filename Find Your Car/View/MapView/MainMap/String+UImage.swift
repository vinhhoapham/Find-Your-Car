//
//  String+UImage.swift
//  Find Your Car
//
//  Created by Vinh Pham on 8/2/22.
//

import Foundation
import UIKit

extension String {
    func UImage(fontSize    : CGFloat = 40,
                backgroundColor      : UIColor = UIColor.clear,
               imageSize    : CGSize? = nil) -> UIImage?
    {
        let font = UIFont.systemFont(ofSize: fontSize)
        let attributes = [NSAttributedString.Key.font: font]
        let imageSize = imageSize ?? self.size(withAttributes: attributes)

        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
        backgroundColor.set()
        let rect = CGRect(origin: .zero, size: imageSize)
        UIRectFill(rect)
        self.draw(in: rect, withAttributes: [.font: font])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
