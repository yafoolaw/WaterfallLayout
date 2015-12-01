//
//  DecorationView.swift
//  WaterfallLayout
//
//  Created by 刘延峰 on 15/12/1.
//  Copyright © 2015年 刘大帅. All rights reserved.
//

import UIKit

class DecorationView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        let imageView = UIImageView(frame: frame)
        imageView.image = UIImage(named: "BookShelf")
        self.addSubview(imageView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
