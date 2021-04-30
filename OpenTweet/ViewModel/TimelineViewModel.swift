//
//  TableViewModel.swift
//  OpenTweet
//
//  Created by Madeline Eckhart on 4/27/21.
//  Copyright © 2021 OpenTable, Inc. All rights reserved.
//

import Foundation
import UIKit

class TimelineViewModel {
    
    var decoder: JSONDecoder?
    var tweets: Timeline?
   
    func create() {
        guard let path = Bundle.main.path(forResource: "timeline", ofType: "json") else { return }
        decoder = JSONDecoder()
        decoder?.dateDecodingStrategy = .iso8601
        
        do {
            let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
            tweets = try decoder?.decode(Timeline.self, from: jsonData as Data)
        } catch {
            print("Error reading json")
        }
    }
    
    func getInfo(row: Int) -> Tweet? {
        return tweets?.timeline[row]
    }
    
    func formatDate(date: Date?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy 'at' h:mm a"
        let dateString: String = dateFormatter.string(from: date!)
        return dateString
    }
    
    func getImage(urlString: String?) -> UIImage {
        var avatar: UIImage = UIImage()
        guard let url = urlString else {
            return UIImage(named: "empty")!
        }
        
        // bang is used because urlString is known
        let imageURL = URL(string: url)!
        
//        DispatchQueue.main.async { //[weak self] in
            if let data = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
                        avatar = image
//                    }
                }
            }
//        }
        // running asynchronously
//        DispatchQueue.global().async {
//            do {
//                let data = try Data(contentsOf: imageURL.absoluteURL)
//                DispatchQueue.main.async {
//                    avatar = UIImage(data: data)!
//                }
//            } catch {
//                print("error loading URL: \(urlString)")
//            }
//        }
        return avatar
    }

    func getContent(content: String?) -> NSMutableAttributedString {
        let mentionsAttribute = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.foregroundColor : UIColor.init(red: 218/255, green: 55/255, blue: 67/255, alpha: 1)]
        let contentAttribute = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor.black]
        
        // if original tweet, keep normal formatting
        if content?.first != "@" {
            return NSMutableAttributedString(string: content ?? "", attributes: contentAttribute)
        }
        
        // splitting tweet and adding attributes
        var contentWords = content?.split{$0 == " "}.map(String.init)
        let mentionWord = contentWords?.first
        contentWords?.removeFirst()
        let tweetWords = contentWords?.joined(separator: " ")
        
        let mentionsString = NSMutableAttributedString(string: mentionWord ?? "", attributes: mentionsAttribute)
        let spaceString = NSMutableAttributedString(string: " ", attributes: contentAttribute)
        let contentString = NSMutableAttributedString(string: tweetWords ?? "", attributes: contentAttribute)
        
        mentionsString.append(spaceString)
        mentionsString.append(contentString)
        return mentionsString
    }
    
    
    
    
    
    
//    func sortRecipes() {
//
//        for r in list_recipes! {
//            let dishEnum = r.data.categories.dishType
//            var type = dishEnum?[0].rawValue
//
//            if type == nil {
//                type = "Other"
//            }
//
//            if dishDict.index(forKey: type!) == nil {
//                dishDict[type!] = []
//                var arr = dishDict[type!]
//                arr?.append(r)
//                dishDict[type!] = arr
//            } else {
//                var arr = dishDict[type!]
//                arr?.append(r)
//                dishDict[type!] = arr
//            }
//        }
//    }
    
}
