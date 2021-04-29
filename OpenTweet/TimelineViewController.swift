//
//  ViewController.swift
//  OpenTweet
//
//  Created by Olivier Larivain on 9/30/16.
//  Copyright © 2016 OpenTable, Inc. All rights reserved.
//

import UIKit

class TimelineViewController: UITableViewController {

    var viewModel = TimelineViewModel()
    
    // MARK: App Lifecycle
    
	override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.create()
	}
    
    // MARK: TableView Set Up
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tweets?.timeline.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweet", for: indexPath) as! TweetTableViewCell
        
        let tweet = viewModel.getInfo(row: indexPath.row)
        
        cell.author.text = tweet?.author
        cell.contents.text = tweet?.content
        cell.date.text = formatDate(date: tweet?.date)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "get_info", sender: self)
//    }
//
    func formatDate(date: Date?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy 'at' h:mm a"
        let dateString: String = dateFormatter.string(from: date!)
        return dateString
    }
}

