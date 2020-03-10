//
//  UIImageViewExtension.swift
//  NeversitupTestProject
//
//  Created by Nirawan Patphet on 10/3/2563 BE.
//  Copyright © 2563 Nirawan Patphet. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func makeRounded() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
