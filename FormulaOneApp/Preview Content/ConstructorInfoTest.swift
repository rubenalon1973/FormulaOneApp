//
//  ConstructorInfoTest.swift
//  MyAppF1_Proyect
//
//  Created by Ruben Alonso on 10/11/23.
//

import Foundation

final class CurrentConstructorInfoRepoTest: CurrentConstructorRepositoryProtocol {
    
    let urlConstructorInfo = Bundle.main.url(forResource: "CurrentConstructorTest", withExtension: "json")!
    
    func getCurrentConstructorInfo() async throws -> [CurrentConstructorInfo] {
        let data = try Data(contentsOf: urlConstructorInfo)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.shortDateFormat)
        
        return try decoder.decode(CurrentConstructorsInfoDTO.self, from: data).mrDataCurrentConstructors.constructorTable.constructors.map { $0.mapToModel() }
    }
}

extension CurrentConstructorInfoVM {
    static let constructorVMTest = CurrentConstructorInfoVM()
}

extension CurrentConstructorInfo {
    static let testCurrentConstructorInfo =
    CurrentConstructorInfo(constructorID: "aston_martin",
                           url: "https://en.wikipedia.org/wiki/Aston_Martin_in_Formula_One",
                           name: "Aston Martin",
                           nationality: "British")
}

extension ConstructorLastStanding {
    static let testConstructorLastStanding = ConstructorLastStanding(position: "1", positionText: "1", points: "822", wins: "20", constructor: InfoConstructor(
        constructorID: "red_bull",
        url: "http://en.wikipedia.org/wiki/Red_Bull_Racing",
        name: "Red Bull",
        nationality: "Austrian"))
}
