//
//  ViewController.swift
//  WaterfallLayout
//
//  Created by FrankLiu on 15/11/13.
//  Copyright © 2015年 刘大帅. All rights reserved.
//
//  https://github.com/yafoolaw
//  http://www.jianshu.com/users/09e77d340dcf/latest_articles
//

import UIKit

let sourceUrl = "http://www.duitang.com/album/1733789/masn/p/0/100/"

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, CHTCollectionViewDelegateWaterfallLayout {
    
    var collectionView : UICollectionView?
    var dataSource     : [AnyObject]? = Array()
    var sizeSource     : [AnyObject]? = Array()
    var layout         : CHTCollectionViewWaterfallLayout?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        buildCollectionView()
        
        loadData()
    }
    
    func buildCollectionView() {
    
        // 初始化布局
        layout = CHTCollectionViewWaterfallLayout()
        
        layout!.sectionInset            = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // section 内边距
        layout!.headerHeight            = 40 // HeaderView高度
        layout!.footerHeight            = 40 // FooterView高度
        layout!.columnCount             = 3  // 几列显示
        layout!.minimumColumnSpacing    = 5  // cell之间的水平间距
        layout!.minimumInteritemSpacing = 5  // cell之间的垂直间距
        
        // 初始化CollectionView
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout!)
        
        collectionView?.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        collectionView?.dataSource       = self
        collectionView?.delegate         = self
        collectionView?.backgroundColor  = UIColor.whiteColor()
        
        // 注册Cell HeaderView FooterView
        collectionView?.registerClass(WaterfallCell.classForCoder(),
            forCellWithReuseIdentifier: cellIdentifier)
        collectionView?.registerClass(CollectionHeaderView.classForCoder(),
            forSupplementaryViewOfKind: layout!.CHTCollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        collectionView?.registerClass(CollectionFooterView.classForCoder(),
            forSupplementaryViewOfKind: layout!.CHTCollectionElementKindSectionFooter, withReuseIdentifier: footerIdentifier)
        
        view.addSubview(collectionView!)
    }
    
    func loadData() {
        
        GCDQueue.globalQueue .excute { () -> Void in
            
            // 获取json数据
            let data = NSData(contentsOfURL: NSURL(string: sourceUrl)!)
            
            // 转换数据
            if let jsonDic = try? NSJSONSerialization.JSONObjectWithData(data!, options: [.MutableContainers, .MutableLeaves]) as![String : AnyObject] {
            
                let array = jsonDic["data"]!["blogs"] as! [AnyObject]
                
                for value in array {
                    
                    let temp = value as! [String : AnyObject]
                    
                    print(temp["isrc"])
                    self.dataSource?.append(ImageModel(dictionary: temp)!)
                }
            }
            
            // 主线程更新
            GCDQueue.mainQueue.excute({ () -> Void in
                
                self.collectionView?.reloadData()
            })
        }
    }
    
    // MARK: UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (dataSource?.count)!
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let waterCell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! WaterfallCell
        
        let imageModel : ImageModel = self.dataSource![indexPath.row] as! ImageModel;
        
        waterCell.showImageView?.sd_setImageWithURL(NSURL(string: imageModel.isrc!));
        
        return waterCell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        var reusableView : UICollectionReusableView?
        
        if kind == layout!.CHTCollectionElementKindSectionHeader {
        
            reusableView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: headerIdentifier, forIndexPath: indexPath)
            
        } else {
        
            reusableView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: footerIdentifier, forIndexPath: indexPath)
        }
        
        return reusableView!
    }
    
    // MARK: CHTCollectionViewDelegateWaterfallLayout
    func collectionView (collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

       let imageModel : ImageModel = self.dataSource![indexPath.row] as! ImageModel
            
       return CGSize(width: CGFloat(imageModel.iwd!), height: CGFloat(imageModel.iht!))
    }
}

