//
//  JSONDecoder.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 12/12/23.
//

import Foundation

func getJSON<JSON: Codable>(url: URL, type: JSON.Type) async throws -> JSON {
    let (data, response) = try await URLSession.shared.data(from: url)
    let decoder = JSONDecoder()
    
    decoder.dateDecodingStrategy = .formatted(.longDateFormat)//pasa al modelo los datos a tipo Date
    guard let httpResponse = response as? HTTPURLResponse else { throw NetworkErrors.general }

    switch httpResponse.statusCode {
        case 200...299:
            do {
                return try decoder.decode(JSON.self, from: data)
            } catch {
                throw NetworkErrors.general
                
            }
        case 400...450:
            throw NetworkErrors.notFound
        default:
            throw NetworkErrors.unknow
    }
}

func getJSONRequest<JSON: Codable>(request: URLRequest, type: JSON.Type) async throws -> JSON {
    let (data, response) = try await URLSession.shared.data(for: request)
    let decoder = JSONDecoder()
    
    decoder.dateDecodingStrategy = .formatted(.longDateFormat)
    guard let httpResponse = response as? HTTPURLResponse else { throw NetworkErrors.general}

    switch httpResponse.statusCode {
        case 200...299:
            do {
                return try decoder.decode(JSON.self, from: data)
            } catch {
                throw NetworkErrors.general
                
            }
        case 400...450:
            throw NetworkErrors.notFound
        default:
            throw NetworkErrors.unknow
    }
}
