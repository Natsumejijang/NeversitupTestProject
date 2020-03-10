//
//  BoderTextfield.swift
//  NongPloyWallet
//
//  Created by Nirawan Patphet on 6/9/2562 BE.
//  Copyright © 2562 Nirawan Patphet. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    enum DirectionLine {
        case Left
        case Right
    }
    
    // add image to textfield
    func withImage(direction: DirectionLine,width: CGFloat, height: CGFloat, image: UIImage, colorSeparator: UIColor, colorBorder: UIColor, placeHolder: String){
        
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: width/5, height: height))
        mainView.layer.cornerRadius = 5
        mainView.layer.borderColor = colorBorder.cgColor
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: width/5, height: height))
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        mainView.addSubview(view)
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 12.0, y: 10.0, width: 24.0, height: 24.0)
        view.addSubview(imageView)
        
        let seperatorView = UIView()
        seperatorView.backgroundColor = colorSeparator
        mainView.addSubview(seperatorView)
        
        if(DirectionLine.Left == direction){ // image left
            seperatorView.frame = CGRect(x: 45, y: 0, width: 5, height: height)
            self.leftViewMode = .always
            self.leftView = mainView
        } else { // image right
            seperatorView.frame = CGRect(x: 0, y: 0, width: 5, height: height)
            self.rightViewMode = .always
            self.rightView = mainView
        }
        
        self.layer.borderColor = colorBorder.cgColor
        self.layer.borderWidth = CGFloat(0.5)
        self.layer.cornerRadius = 10
        self.placeholder = placeHolder
        self.tintColor = UIColor.white
        
//
//        let arbitraryValue: Int = 150
//        if let newPosition = self.position(from: self.beginningOfDocument, offset: arbitraryValue) {
//            self.selectedTextRange = self.textRange(from: newPosition, to: newPosition)
//        }
    }
}
