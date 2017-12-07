//
//  ZZJSearchResultView.swift
//  ZZJSearchControllerProject
//
//  Created by JOE on 2017/12/7.
//  Copyright © 2017年 JOE. All rights reserved.
//

import UIKit

class ZZJSearchResultView: UIView {

    ///model
    var model:ZZJSearchResultModel? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    ///tableView
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.backgroundColor = UIColor.white
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: UI
extension ZZJSearchResultView {
    
    fileprivate func createView() {
        backgroundColor = UIColor.white
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
}

















