//
//  Article.swift
//  (Elected) Officials
//
//  Created by C4Q on 11/13/16.
//  Copyright © 2016 Harichandan Singh. All rights reserved.
//

import Foundation

class Article {
    let snippet: String
    let url: URL
    
    init (snippet: String, url: URL) {
        self.snippet = snippet
        self.url = url
    }
    
    convenience init? (dict: [String: AnyObject]) {
        guard let urlString = dict["web_url"] as? String else {
            print("url failed")
            return nil
        }
        guard let url = URL(string: urlString) else {
            return nil
        }
        guard let snippet = dict["snippet"] as? String else {
            return nil
        }
        
        self.init(snippet: snippet, url: url)
    }
    
    static func getArticles (data: Data) -> [Article]? {
        
        var arr = [Article]()
        
        do {
            let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard let dict = jsonData as? [String: AnyObject] else {
                return nil
            }
            
            guard let response = dict["response"] as? [String: AnyObject] else {
                return nil
            }
            
            guard let docs = response["docs"] as? [[String: AnyObject]] else {
                print("docs failed")
                return nil
            }
            
            for doc in docs {
               arr.append(Article(dict: doc)!)
            }
        }
        catch {
            print(error)
        }
        return arr
    }
}
