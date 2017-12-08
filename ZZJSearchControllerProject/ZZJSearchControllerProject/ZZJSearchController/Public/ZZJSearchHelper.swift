//
//  ZZJSearchHelper.swift
//  ZZJSearchControllerProject
//
//  Created by JOE on 2017/12/8.
//  Copyright © 2017年 JOE. All rights reserved.
//

import UIKit

class ZZJSearchHelper: NSObject {

    ///使用谓词进行搜索，返回一个结果数组
    class func filterBySubstring(subStr: String, dataArray: [String]) -> [String] {
        var resultArray = [String]()
        
        //定义谓词
        let pred = ZZJSearchNSPredicate(subStr)
        //使用谓词过滤
        resultArray = (dataArray as NSArray).filtered(using: pred) as! [String]
        return resultArray
    }
}
