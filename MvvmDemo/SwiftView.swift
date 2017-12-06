//
//  SwiftView.swift
//  MvvmDemo
//
//  Created by fan on 17/1/12.
//  Copyright © 2017年 changhog. All rights reserved.
//

import Foundation
class SwiftView: UIView {
    
    func createrButton(btName:NSString,corolrString:String) -> UIButton {
        
        let customBt:UIButton = UIButton(frame: CGRect(x: 10, y: 80, width: 50, height: 50))

        customBt .setTitle(btName as String, for: UIControlState(rawValue: UInt(0)))
        
        
        return customBt
        
        
        
    }
    
}
