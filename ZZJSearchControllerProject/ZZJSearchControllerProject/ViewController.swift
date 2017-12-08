//
//  ViewController.swift
//  ZZJSearchControllerProject
//
//  Created by JOE on 2017/12/7.
//  Copyright © 2017年 JOE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    ///数据源
    lazy var dataArray:[String] = {
        var dataArray = [String]()
        for i in 0..<30 {
            dataArray.append("第\(i)条数据")
        }
        return dataArray
    }()
    
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
        //searchView
        let searchView = ZZJSearchView(frame: CGRect.zero)
        searchView.delegate = self
        searchView.showInView(view: ZZJSearchKeyWindow)
        searchView.showWithBlock { (searchText) in
            print("searchText \(searchText)")
            //使用谓词过滤
            let tempModel = ZZJSearchResultModel()
            tempModel.results = ZZJSearchHelper.filterBySubstring(subStr: searchText, dataArray: self.dataArray)
            searchView.searchResultView.model = tempModel
        }
    }
}

extension ViewController: ZZJSearchViewDelegate {
    
    func resultTableView(didSelectRowAt indexPath: IndexPath, model: String?) {
        
        let vc = ZZJSearchResultDisplayViewController()
        vc.title = model
        let r = CGFloat(arc4random()%255)*1.0
        let g = CGFloat(arc4random()%255)*1.0
        let b = CGFloat(arc4random()%255)*1.0
        vc.view.backgroundColor = ZZJSearchRGB(r, g, b)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}












