//
//  Article.swift
//  News
//
//  Created by Pasha Khorenko on 09.02.2022.
//

import Foundation

struct Article {
    
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    
    init(dictiionary: Dictionary<String, Any>) {
        author = dictiionary["author"] as? String ?? ""
        title = dictiionary["title"] as? String ?? ""
        description = dictiionary["description"] as? String ?? ""
        url = dictiionary["url"] as? String ?? ""
        urlToImage = dictiionary["urlToImage"] as? String ?? ""
        publishedAt = dictiionary["publishedAt"] as? String ?? ""
    }
}
