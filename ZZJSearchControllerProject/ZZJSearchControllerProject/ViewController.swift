//
//  ViewController.swift
//  ZZJSearchControllerProject
//
//  Created by JOE on 2017/12/7.
//  Copyright © 2017年 JOE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
        
        //btn
        let rightBtn = UIBarButtonItem.init(barButtonSystemItem: .search, target: self, action: #selector(btnClick))
        self.navigationItem.rightBarButtonItem = rightBtn
        
        //color view
        let yelloView = UIView()
        yelloView.frame = CGRect(x: (ZZJScreenWidth-200)/2, y: 100, width: 200, height: 100)
        yelloView.backgroundColor = UIColor.yellow
        view.addSubview(yelloView)
        
        let greenView = UIView()
        greenView.frame = CGRect(x: (ZZJScreenWidth-200)/2, y: 300, width: 200, height: 100)
        greenView.backgroundColor = UIColor.green
        view.addSubview(greenView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @objc fileprivate func btnClick() {
        let searchView = ZZJSearchView(frame: CGRect.zero)
        searchView.showInView(view: ZZJSearchKeyWindow)
        searchView.showWithBlock { (searchText) in
            print("searchText \(searchText)")
        }
    }
}














