//
//  ImageModel.swift
//
//  http://www.cnblogs.com/YouXianMing/
//  https://github.com/YouXianMing
//
//  Copyright (c) YouXianMing All rights reserved.
//

import UIKit

class ImageModel: NSObject {
    
    var isrc          : String?   // 图片链接
    var iwd           : NSNumber? // 图片宽度
    var iht           : NSNumber? // 图片高度
    var ava           : String?
    var common        : NSNumber?
    var good          : NSNumber?
    var albid         : NSNumber?
    var sta           : NSNumber?
    var repc          : NSNumber?
    var id            : NSNumber?
    var uid           : NSNumber?
    var favc          : NSNumber?
    var unm           : String?
    var zanc          : NSNumber?
    var ruid          : NSNumber?
    var photo_id      : NSNumber?
    var coupon_price  : NSNumber?
    var price         : NSNumber?
    var albnm         : String?
    var rid           : NSNumber?
    var msg           : String?
    
    // init method
    
    override init() {
        
    }
    
    init?(dictionary : [String : AnyObject]?) {
        
        super.init()
        
        if let _ : [String : AnyObject] = dictionary {
            
            setValuesForKeysWithDictionary(dictionary!)
            
        } else {
            
            return nil
        }
    }
    
    // setValueForKey & setValueForUndefinedKey
    
    override func setValue(value: AnyObject?, forKey key: String) {
    
        super.setValue(value, forKey: key)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
        print("The file \(self.classForCoder).h has an undefined key \"\(key)\", and the key's type is \(value?.classForCoder).")
    }
}
