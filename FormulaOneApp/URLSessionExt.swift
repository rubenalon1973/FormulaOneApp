//
//  URLSessionExt.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import Foundation

enum NetworkErrors: String, Error {
    case urlRequestNotValid
    case general
    case badResponse
    case notFound
    case unknown
    
    var description: String {
        switch self {
            case .urlRequestNotValid:
                return "URL Request Not Valid"
            case .general:
                return "General Error"
            case .badResponse:
                return "Wrong answer from the server"
            case .notFound:
                return "Not found"
            case .unknown:
                return "Unknow error"
        }
    }
}

extension URLSession {
    func dataRequest(urlReq: URLRequest) async throws -> (Data, URLResponse) {
        do {
            return try await data(for: urlReq)
        } catch {
            throw NetworkErrors.urlRequestNotValid
        }
    }
}
