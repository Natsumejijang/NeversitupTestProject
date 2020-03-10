//
//  UIViewControllerExtension.swift
//  NongPloyWallet
//
//  Created by Nirawan Patphet on 10/9/2562 BE.
//  Copyright © 2562 Nirawan Patphet. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setTextfeild(imageName: String, textField: UITextField, placeHolder: String) {
        if let myImage = UIImage(named: imageName){
            textField.withImage(direction: .Left, width: textField.frame.width, height: textField.frame.height, image: myImage, colorSeparator: UIColor.orange, colorBorder: UIColor.white, placeHolder: placeHolder)
            
            textField.allowsEditingTextAttributes = true
        }
    }
    
    func alertMessage(_ message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("ตกลง", comment: ""), style: .default) { action in
        }
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
