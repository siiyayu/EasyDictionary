//
//  APIManager.swift
//  EasyDictrionary
//
//  Created by Андрей Беляев on 20/04/2019.
//  Copyright © 2019 Андрей Беляев. All rights reserved.
//

import Foundation
typealias JSONTask = URLSessionDataTask
typealias JSONcompletionHandler = ([String: AnyObject]?, HTTPURLResponse?, Error?) -> Void

protocol FinalURLPoint {
    var baseURL: URL {get}
    var path: String {get} //добавляемая часть url
    var request: URLRequest {get}
}

enum APIResult<T> {
    case Success(T)
    case Failure(Error)
}

protocol APIManager {
    var sessionConfiguration: URLSessionConfiguration { get }
    var session: URLSession { get }
    func JSONTaskWith(request: URLRequest, completionHandler: JSONcompletionHandler) -> JSONTask
    func fetch<T>(request: URLRequest, parse: @escaping ([String: AnyObject]) -> T?, completionHandler: @escaping (APIResult<T>) -> Void)
}

extension APIManager {
    func JSONTaskWith(request: URLRequest, completionHandler: @escaping JSONcompletionHandler) -> JSONTask {
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            guard let HTTPResponse = response as? HTTPURLResponse else {
                let userInfo = [
                    NSLocalizedDescriptionKey: NSLocalizedString("MissingHTTPResponse" , comment: "")
                ]
                let error = NSError(domain: EASNetworkingErrorDomain, code: MissingHTTPResponseErrorCode, userInfo: userInfo)
                completionHandler(nil, nil, error)
                return
            }
            if data == nil{
                if let error = error {
                    completionHandler(nil, HTTPResponse, error)
                }
                else {
                    switch HTTPResponse.statusCode {
                    case 200:
                        do {
                            let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: AnyObject]
                            completionHandler(json, HTTPResponse, nil)
                        } catch let error as NSError {
                            completionHandler(nil, HTTPResponse, error)
                        }
                    default:
                        print("We have got response status \(HTTPResponse.statusCode)")
                    }
                }
            }
        }
        return dataTask
    }


func fetch<T>(request: URLRequest, parse: @escaping ([String: AnyObject]) -> T?, completionHandler: @escaping (APIResult<T>) -> Void) {
    let dataTask = JSONTaskWith(request: request) { (json, response, error) in
        guard let json = json else {
        if let error = error {
            completionHandler(.Failure(error))
            }
            return
        }
        if let value = parse(json) {
            completionHandler(.Success(value))
        } else {
            let error = NSError(domain: EASNetworkingErrorDomain, code: 200, userInfo: nil)
            completionHandler(.Failure(error))
        }
    }
    dataTask.resume()
}
}
