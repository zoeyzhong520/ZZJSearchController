//
//  ZZJSearchResultView.swift
//  ZZJSearchControllerProject
//
//  Created by JOE on 2017/12/7.
//  Copyright © 2017年 JOE. All rights reserved.
//

import UIKit

@objc protocol ZZJSearchResultViewDelegate {
    @objc optional func ZZJSearchResultScrollViewDidScroll(_ scrollView: UIScrollView)
    @objc optional func ZZJSearchResultTableView(didSelectRowAt indexPath: IndexPath, model: String?)
}

class ZZJSearchResultView: UIView {

    ///delegate
    weak var delegate:ZZJSearchResultViewDelegate?
    
    ///model
    var model:ZZJSearchResultModel? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    ///tableView
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.backgroundColor = UIColor.clear
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ZZJSearchResultTableViewCell.self, forCellReuseIdentifier: "ZZJSearchResultTableViewCellId")
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
        backgroundColor = UIColor.clear
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
}

extension ZZJSearchResultView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let cnt = model?.results?.count {
            return cnt
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ZZJSearchResultTableViewCell.heightForCell(model: self.model?.results?[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ZZJSearchResultTableViewCell.createCell(tableView: tableView, atIndexPath: indexPath, model: self.model?.results?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if delegate != nil {
            delegate?.ZZJSearchResultTableView!(didSelectRowAt: indexPath, model: self.model?.results?[indexPath.row])
        }
    }
}

//MARK: UIScrollViewDelegate
extension ZZJSearchResultView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if delegate != nil {
            delegate?.ZZJSearchResultScrollViewDidScroll!(scrollView)
        }
    }
}














