//
//  UIView+CornerRadius.swift
//  Reciplease
//
//  Created by Elora on 02/02/2023.
//

import Foundation
import UIKit

extension UIView {
    
    /**
     Set corner radius for sprecific edges
     */
    public func setCornerRadius(_ radius: CGFloat = 12,
                                edges: CACornerMask = [
                                    .layerMaxXMaxYCorner,
                                    .layerMaxXMinYCorner,
                                    .layerMinXMaxYCorner,
                                    .layerMinXMinYCorner
                                ]) {
                                    self.layer.masksToBounds = true
                                    self.layer.cornerCurve = .continuous
                                    self.layer.cornerRadius = radius
                                    self.layer.maskedCorners = edges
                                }
}
