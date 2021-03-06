//
//  ZZJSearchView.swift
//  ZZJSearchControllerProject
//
//  Created by JOE on 2017/12/7.
//  Copyright © 2017年 JOE. All rights reserved.
//

import UIKit

@objc protocol ZZJSearchViewDelegate {
    @objc optional func resultTableView(didSelectRowAt indexPath: IndexPath, model: String?)
}

class ZZJSearchView: UIView {

    ///delegate
    weak var delegate:ZZJSearchViewDelegate?
    
    ///searchBar
    var searchBar:UISearchBar!
    
    ///contentView
    var contentView:UIView?
    
    ///ContentViewHeight
    var ContentViewHeight:CGFloat = CGFloat(ZZJSearchNavigationBarHeight+ZZJSearchStatusBarHeight)
    
    ///completeBlock
    var completeBlock:((String) -> Void)?
    
    ///searchResultView
    var searchResultView:ZZJSearchResultView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: UI
extension ZZJSearchView {
    
    fileprivate func setupContent() {
        self.frame = CGRect(x: 0, y: 0, width: ZZJScreenWidth, height: ZZJScreenHeight)
        backgroundColor = ZZJSearchRGBA(0, 0, 0, 0.2)
        isUserInteractionEnabled = true
        //addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(disMissView)))
        
        if contentView == nil {
            contentView = UIView()
            contentView?.frame = CGRect(x: 0, y: 0, width: ZZJScreenWidth, height: ContentViewHeight)
            contentView?.backgroundColor = UIColor.white
            addSubview(contentView!)
            
            configContent()
        }
    }
    
    fileprivate func configContent() {
        //设置searchBar
        searchBar = UISearchBar(frame: CGRect(x: 0, y: CGFloat(ZZJSearchStatusBarHeight), width: ZZJScreenWidth, height: ContentViewHeight-CGFloat(ZZJSearchStatusBarHeight)))
        searchBar.barStyle = .default
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "搜索"
        searchBar.becomeFirstResponder()
        searchBar.delegate = self
        contentView?.addSubview(searchBar)
        
        //设置searchResultView
        searchResultView = ZZJSearchResultView(frame: CGRect.zero)
        searchResultView.delegate = self
        addSubview(searchResultView)
        searchResultView.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom)
            make.left.right.bottom.equalTo(self)
        }
    }
    
    //MARK: 界面显示
    func showInView(view: UIView?) {
        if view == nil {
            return
        }
        
        view?.addSubview(self)
        
        backgroundColor = ZZJSearchRGBA(0, 0, 0, 0)
        contentView?.frame = CGRect(x: ZZJScreenWidth*2, y: 0, width: ZZJScreenWidth, height: self.ContentViewHeight)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundColor = ZZJSearchRGBA(0, 0, 0, 0.2)
            self.contentView?.frame = CGRect(x: 0, y: 0, width: ZZJScreenWidth, height: self.ContentViewHeight)
        }, completion: nil)
    }
    
    //MARK: 界面消失
    @objc fileprivate func disMissView() {
        backgroundColor = ZZJSearchRGBA(0, 0, 0, 0.2)
        contentView?.frame = CGRect(x: 0, y: 0, width: ZZJScreenWidth, height: ContentViewHeight)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundColor = ZZJSearchRGBA(0, 0, 0, 0)
            self.contentView?.frame = CGRect(x: ZZJScreenWidth*2, y: 0, width: ZZJScreenWidth, height: self.ContentViewHeight)
            self.searchBar.resignFirstResponder()
        }) { (finish) in
            self.removeFromSuperview()
        }
    }
    
    //MARK: 显示视图
    func showWithBlock(completeBlock: @escaping ((String) -> Void)) {
        self.completeBlock = completeBlock
    }
}

//MARK: UISearchBarDelegate
extension ZZJSearchView: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        disMissView()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if self.completeBlock != nil && searchBar.text != nil {
            completeBlock!(searchBar.text!)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if self.completeBlock != nil && searchText.isEmpty == false {
            completeBlock!(searchText)
        }else{
            self.searchResultView.model = nil
        }
    }
}

extension ZZJSearchView: ZZJSearchResultViewDelegate {
    
    func ZZJSearchResultScrollViewDidScroll(_ scrollView: UIScrollView) {
        self.searchBar.resignFirstResponder()
    }
    
    func ZZJSearchResultTableView(didSelectRowAt indexPath: IndexPath, model: String?) {
        self.disMissView()
        if delegate != nil {
            delegate?.resultTableView!(didSelectRowAt: indexPath, model: model)
        }
    }
}











