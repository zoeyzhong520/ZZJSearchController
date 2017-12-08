//
//  ZZJSearchUILabel+Util.swift
//  ZZJSearchControllerProject
//
//  Created by JOE on 2017/12/8.
//  Copyright © 2017年 JOE. All rights reserved.
//

import UIKit

extension UILabel {
    
    convenience init(text:String?=nil, font:UIFont?=nil, textColor:UIColor?=nil, textAlignment:NSTextAlignment?=nil, masksToBounds:Bool?=nil, cornerRadius:CGFloat?=nil, borderColor:UIColor?=nil, borderWidth:CGFloat?=nil, adjustsFontSizeToFitWidth:Bool?=nil, numberOfLines: Int?=nil) {
        
        self.init()
        
        if let tmpText = text {
            self.text = tmpText
        }
        
        if let tmpFont = font {
            self.font = tmpFont
        }
        
        if let tmpTextColor = textColor {
            self.textColor = tmpTextColor
        }
        
        if let tmpTextAligment = textAlignment {
            self.textAlignment = tmpTextAligment
        }
        
        if let tempAdjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth {
            self.adjustsFontSizeToFitWidth = tempAdjustsFontSizeToFitWidth
        }
        
        if let tempNumberOfLines = numberOfLines {
            self.numberOfLines = tempNumberOfLines
        }
        
        
        if let tempMasksToBounds = masksToBounds {
            self.layer.masksToBounds = tempMasksToBounds
        }
        
        if let tempCornerRadius = cornerRadius {
            self.layer.cornerRadius = tempCornerRadius
        }
        
        if let tempBorderColor = borderColor {
            self.layer.borderColor = tempBorderColor.cgColor
        }
        
        if let tempBorderWidth = borderWidth {
            self.layer.borderWidth = tempBorderWidth
        }
    }
    
    /**
     *高度自适应
     */
    class func getHeightByWidth(title:String?, width:CGFloat?, font:UIFont?) -> CGFloat {
        
        guard let tempTitle = title else {
            return 0
        }
        
        guard let tempWidth = width else {
            return 0
        }
        
        guard let tempFont = font else {
            return 0
        }
        
        let label = UILabel(text: tempTitle, font: tempFont, textAlignment: .left)
        label.frame = CGRect(x: 0, y: 0, width: tempWidth, height: 0)
        label.numberOfLines = 0
        label.sizeToFit()
        
        let height:CGFloat = label.frame.size.height
        return height
    }
    
    /**
     *宽度自适应
     */
    class func getWidthWithTitle(title:String?, height:CGFloat?, font:UIFont?) -> CGFloat {
        
        guard let tempTitle = title else {
            return 0
        }
        
        guard let tempHeight = height else {
            return 0
        }
        
        guard let tempFont = font else {
            return 0
        }
        
        let label = UILabel(text: tempTitle, font: tempFont, textAlignment: .left)
        label.frame = CGRect(x: 0, y: 0, width: 0, height: tempHeight)
        label.sizeToFit()
        
        let width:CGFloat = label.frame.size.width
        return width
    }
}
