//
//  TranslationManager.swift
//  EasyDictrionary
//
//  Created by Андрей Беляев on 21/04/2019.
//  Copyright © 2019 Андрей Беляев. All rights reserved.
//

import Foundation

public var askword: String = ""


enum TranslationType: FinalURLPoint {
    case Basic(apiKey: String, word: String)

    var baseURL: URL {
        return URL(string: "https://dictionary.yandex.net/api/v1/dicservice.json/lookup?key=")!
    }
    
    var path: String {
        switch self {
        case .Basic(let apiKey, let askword):
            return "\(apiKey)/&lang=en-ru&text=\(askword)"
        }
    }
    var request: URLRequest {
        let url = URL(string: path, relativeTo: baseURL)
        return URLRequest(url: url!)
    }
}
//struct TranslationType: FinalURLPoint {
//    var request: URLRequest
//
//    var baseURL: URL {
//        return URL(string: "https://dictionary.yandex.net/api/v1/dicservice.json/lookup?key=")!
//    }
//
//    var path: String {
//            return "\(apiKey)/&lang=en-ru&text=\(word)"
//        }
//    }
//}




final class APITranslationManager: APIManager {
    
    let sessionConfiguration: URLSessionConfiguration
    lazy var session: URLSession = {
        return URLSession(configuration: self.sessionConfiguration)
    } ()
    
    let apiKey: String
    
    init(sessionConfiguration: URLSessionConfiguration, apiKey: String) {
        self.sessionConfiguration = sessionConfiguration
        self.apiKey = apiKey
    }
    
    convenience init(apiKey: String) {
        self.init(sessionConfiguration: URLSessionConfiguration.default, apiKey: apiKey)
    }
    
    func fetchWordWith(word: String, completionHandler: @escaping (APIResult<CurrentWord>) -> Void) {
        let request = TranslationType.Basic(apiKey: self.apiKey, word: askword).request
        fetch(request: request, parse: { (json) -> JSONdataStruct? in
            let parsedResult: dataStruct = try? JSONDecoder().decode(dataStruct.self, from: json)
            return CurrentWord(parsedResult)
        },
        completionHandler: completionHandler)
    }
}


