//
//  File.swift
//  My Movies
//
//  Created by karim metawea on 5/10/19.
//  Copyright © 2019 KarimMetawea. All rights reserved.
//

import UIKit

extension UIView {
    
    func roundShapeAndMakeShadow(border:CGFloat,ShadowOffset:CGSize,borderColor:UIColor){
        
        
        self.layer.cornerRadius = self.frame.size.height/2
        self.layer.borderWidth = border
        self.layer.borderColor = borderColor.cgColor
        self.layer.shadowColor = Theme.tintColor?.cgColor
        self.layer.shadowOffset = ShadowOffset
        
        
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

