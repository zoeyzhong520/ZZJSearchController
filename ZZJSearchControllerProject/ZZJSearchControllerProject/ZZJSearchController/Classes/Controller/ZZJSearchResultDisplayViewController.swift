//
//  ZZJSearchResultDisplayViewController.swift
//  ZZJSearchControllerProject
//
//  Created by JOE on 2017/12/8.
//  Copyright © 2017年 JOE. All rights reserved.
//

import UIKit

class ZZJSearchResultDisplayViewController: ZZJSearchBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let subTitleLabel = UILabel(text: title, font: UIFont.systemFont(ofSize: 18), textColor: UIColor.white, textAlignment: .center)
        view.addSubview(subTitleLabel)
        subTitleLabel.snp.makeConstraints { (make) in
            make.center.width.equalTo(view)
            make.height.equalTo(36)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
