//
//  CollectionHeaderView.swift
//  WaterfallLayout
//
//  Created by FrankLiu on 15/11/13.
//  Copyright © 2015年 刘大帅. All rights reserved.
//
//  https://github.com/yafoolaw
//  http://www.jianshu.com/users/09e77d340dcf/latest_articles
//

import UIKit

let headerIdentifier = "WaterfallHeader"

class CollectionHeaderView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.layer.borderWidth = 1
        self.backgroundColor   = UIColor.redColor()
    }

    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
        
}
