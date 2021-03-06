//
//  Constants.swift
//  youtube-otb
//
//  Created by Mark D on 8/6/20.
//  Copyright © 2020 MAD Endeavors. All rights reserved.
//

import Foundation
// Not loading

struct Constants {
    
    static var API_KEY = "AIzaSyBQQso1N9THB9D4kFRTsqo80LXKUiwrYcE"
    //static var PLAYLIST_ID = "PLMRqhzcHGw1YSKIO61XncxTPoFu81K1Mx"
    static var PLAYLIST_ID = "UU2D6eRvCeMtcF5OGHf1-trw"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
    static var VIDEOCELL_ID = "VideoCell"
    static var YT_EMBED_URL = "https://www.youtube.com/embed/"
    
}
