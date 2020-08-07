//
//  Model.swift
//  youtube-otb
//
//  Created by Mark D on 8/6/20.
//  Copyright © 2020 MAD Endeavors. All rights reserved.
//

import Foundation

class Model {
    
    func getVideos() {
        
        // Create a url object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        
        // Get a URL session object
        let session = URLSession.shared
        
        // Get a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if errors
            if error != nil || data == nil {
                return
            }
            
            do {
                // Parsing the data
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601

                let response = try decoder.decode(Response.self, from: data!)

                dump(response)
                
            }
            catch {
                
            }
            
        }
        
        // Kick off the task
        dataTask.resume()
        
        
    }
}