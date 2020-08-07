//
//  ViewController.swift
//  youtube-otb
//
//  Created by Mark D on 8/6/20.
//  Copyright © 2020 MAD Endeavors. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
        
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        tableView.dataSource = self
        tableView.delegate = self
        
        // Set itself as delegate of the model
        model.delegate = self
        
        model.getVideos()
        
    }
    
    // MARK: - Model Delegate Methods
    
    func videosFetched(_ videos:[Video]) {
        
        // Set the returned videos to our video property
        self.videos = videos
        
        // Refresh the tableview
        tableView.reloadData()
        
    }
    // MARK: - Table view methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        // Configure cell with data
        // Get the title
        let title = self.videos[indexPath.row].title
        
        cell.textLabel?.text = title

        // Return the cell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }



}

