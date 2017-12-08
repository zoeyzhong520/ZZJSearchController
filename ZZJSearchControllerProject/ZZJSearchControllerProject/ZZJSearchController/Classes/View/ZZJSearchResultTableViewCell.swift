//
//  ZZJSearchResultTableViewCell.swift
//  ZZJSearchControllerProject
//
//  Created by JOE on 2017/12/8.
//  Copyright © 2017年 JOE. All rights reserved.
//

import UIKit

class ZZJSearchResultTableViewCell: UITableViewCell {

    ///model
    var model:String? {
        didSet {
            showData()
        }
    }
    
    fileprivate func showData() {
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
        
        self.backgroundColor = UIColor.clear
        
        //detailView
        let detailView = UIView()
        self.contentView.addSubview(detailView)
        detailView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.contentView)
        }
        
        let titleLabel = UILabel()
        titleLabel.text = self.model
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textAlignment = .left
        detailView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(detailView).inset(UIEdgeInsetsMake(0, 20, 0, 0))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ZZJSearchResultTableViewCell {
    
    ///创建cell的方法
    class func createCell(tableView: UITableView, atIndexPath indexPath: IndexPath, model: String?) -> ZZJSearchResultTableViewCell {
        
        let cellId = "ZZJSearchResultTableViewCellId"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? ZZJSearchResultTableViewCell
        if cell == nil {
            print("创建cell失败")
        }
        cell?.model = model
        return cell!
    }
    
    ///返回cell的高度
    class func heightForCell(model: String?) -> CGFloat {
        
        var cellHeight:CGFloat = 0.0
        let height = UILabel.getHeightByWidth(title: model, width: ZZJScreenWidth-20, font: UIFont.systemFont(ofSize: 18))
        cellHeight = height+18
        return cellHeight
    }
}



















