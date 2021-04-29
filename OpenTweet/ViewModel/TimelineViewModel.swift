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
//        sortRecipes()
    }
    
    func getInfo(row: Int) -> Tweet? {

        return tweets?.timeline[row]
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
