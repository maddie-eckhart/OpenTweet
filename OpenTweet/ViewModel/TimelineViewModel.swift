//
//  TableViewModel.swift
//  OpenTweet
//
//  Created by Madeline Eckhart on 4/27/21.
//  Copyright © 2021 OpenTable, Inc. All rights reserved.
//

import Foundation

class TimelineViewModel {
    
    var decoder: JSONDecoder?
    var timeline: Timeline?
    var tweets = [Tweet]()
//    var keys:[String] = []
//    var dishDict = [String: [RecipeList]]()
   
    func create() {
        guard let path = Bundle.main.path(forResource: "timeline", ofType: "json") else { return }
        let jsonData = try? NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
        decoder = JSONDecoder()
//        timeline = try! decoder?.decode(Timeline.self, from: jsonData! as Data)
        
        
        if let data = jsonData,
           let json = try! JSONSerialization.jsonObject(with: data as Data, options: []) as? [String: Any] {
            for tweet in json["timeline"]! {
//                if let restaurant = Restaurant(json: tweet) {
                    tweets.append(tweet)
//                }
            }
        }
        
        
        
//        sortRecipes()
    }
    
    func getInfo(row: Int) -> Tweet {
        
        return timeline![row]
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
