//
//  URLRequestExt.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import Foundation

extension URLRequest {
    static func getCurrentResultsRequest(url: URL, limit: Int) -> URLRequest {
        var request = URLRequest(url: url)
        request.url?.append(queryItems: [URLQueryItem(name: "limit", value: String(limit))])
        request.httpMethod = "GET"

        return request
    }
}
