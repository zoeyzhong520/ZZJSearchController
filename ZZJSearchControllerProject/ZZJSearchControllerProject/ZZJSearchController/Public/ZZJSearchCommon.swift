//
//  ZZJSearchCommon.swift
//  ZZJSearchControllerProject
//
//  Created by JOE on 2017/12/7.
//  Copyright © 2017年 JOE. All rights reserved.
//

import UIKit
import SnapKit

//MARK: - 尺寸信息

///屏幕宽度
let ZZJScreenWidth = UIScreen.main.bounds.size.width

///屏幕高度
let ZZJScreenHeight = UIScreen.main.bounds.size.height

///tabbar切换视图控制器高度
let ZZJSearchTabbarHeight = Double(UIApplication.shared.statusBarFrame.height > 20 ? 83 : 49)//适配iPhoneX

///搜索视图高度
let ZZJSearchBarHeight = 45.0

///状态栏高度
let ZZJSearchStatusBarHeight = Double(UIApplication.shared.statusBarFrame.height)

///导航栏高度
let ZZJSearchNavigationBarHeight = 44.0


//MARK: - 常用颜色

///根据RGB生成颜色
let ZZJSearchRGB: (CGFloat, CGFloat, CGFloat) -> UIColor = { red, green, blue in
    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1.0)
}

///根据RGBA生成颜色
let ZZJSearchRGBA: (CGFloat, CGFloat, CGFloat, CGFloat) -> UIColor = { red, green, blue, alpha in
    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
}


//MARK: - KeyWindow

///KeyWindow
let ZZJSearchKeyWindow = UIApplication.shared.keyWindow













