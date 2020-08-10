//
//  VideoTableViewCell.swift
//  youtube-otb
//
//  Created by Mark D on 8/7/20.
//  Copyright © 2020 MAD Endeavors. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(_ v:Video) {
        
        self.video = v
        
        guard self.video != nil else {
            return
        }
        // set the date and title
        self.titleLabel.text = video?.title
        
        let df = DateFormatter()
       
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // Set the thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        // check cache before downloading data
        if let cacheData = CacheManager.getVideoCache(self.video!.thumbnail) {
            // Set the thumbnail imageview
            self.thumbnailImageView.image = UIImage(data: cacheData)
            return
            
        }
        
        let url = URL(string: self.video!.thumbnail)
        
        // Get the shared url session
        let session = URLSession.shared
        
        // Create datatask
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
            
                // Save the data in cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                // Check that download url matches
                if url?.absoluteString != self.video?.thumbnail {
                    // Has been recycled
                    return
                }
                // Create the data image
                let image = UIImage(data: data!)
                
                // Set the imageview
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
                
            }
        }
        // Start data task
        dataTask.resume()
        
    }
}
