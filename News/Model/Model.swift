//
//  Model.swift
//  News
//
//  Created by Pasha Khorenko on 09.02.2022.
//

import Foundation

var articles: [Article] {

    let data = try? Data(contentsOf: urlToData)
    if data == nil {
        return []
    }

    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    if rootDictionaryAny == nil {
        return []
    }

    let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
    if rootDictionary == nil {
        return []
    }

    if let array = rootDictionary!["articles"] as? [Dictionary<String, Any>] {
        var returnArray: [Article] = []

        for dict in array {
            let newArticle = Article(dictiionary: dict)
            returnArray.append(newArticle)
        }
        return returnArray

    }

    return []

}


var urlToData: URL {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] + "/data.json"
    let urlPath = URL(fileURLWithPath: path)
    
    return urlPath
}


// функция загрузки json
func loadNews(completionHandler: (() -> Void)?) {
    
    let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=11a430b6389d4e96a2ab4d81ce74237f")
    
    let session = URLSession(configuration: .default)
    let downloadTask = session.downloadTask(with: url!) { (urlFile, response, error) in
        
        if urlFile != nil {
            
            try? FileManager.default.copyItem(at: urlFile!, to: urlToData)
            
            print(urlToData)
            completionHandler?()
        }
    }
    
    downloadTask.resume()
}

/*
func parseNews() {
    
    Функция парсинга json. Её реализация пересена в вычисляемое свойства aeticles: [Article]
    для оптимизации работы программы.
    
    
        
}
*/
