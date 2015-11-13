//
//  WaterfallCell.swift
//  WaterfallLayout
//
//  Created by FrankLiu on 15/11/13.
//  Copyright © 2015年 刘大帅. All rights reserved.
//
//  https://github.com/yafoolaw
//  http://www.jianshu.com/users/09e77d340dcf/latest_articles
//

import UIKit

let cellIdentifier = "WaterfallCell"

class WaterfallCell: UICollectionViewCell {
    
    var showImageView: UIImageView?
    
    override init(frame: CGRect) {
       
        super.init(frame: frame)
        
        let imageViewRect:CGRect = CGRect(x: 0, y: 0, width: CGRectGetMaxX(self.contentView.bounds), height: CGRectGetMaxY(self.contentView.bounds))
        
        showImageView = UIImageView(frame: imageViewRect)
        showImageView?.contentMode      = .ScaleAspectFill
        showImageView?.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
        showImageView?.clipsToBounds    = true
        
        self.addSubview(showImageView!)
        
        self.layer.borderWidth = 0.5
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
