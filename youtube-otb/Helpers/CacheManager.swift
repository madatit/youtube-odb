//
//  CacheManager.swift
//  youtube-otb
//
//  Created by Mark D on 8/10/20.
//  Copyright © 2020 MAD Endeavors. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    
    static func setVideoCache (_ url:String, _ data:Data?) {
    
        // Store the image data and use url as key
        cache[url] = data
        
    }
    
    static func getVideoCache (_ url:String) -> Data? {
    
        return cache[url]
    
    }
    
}
