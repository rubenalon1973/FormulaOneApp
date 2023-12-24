//
//  CurrentConstructorInfoVM.swift
//  MyAppF1_Proyect
//
//  Created by Ruben Alonso on 10/11/23.
//

import Foundation

final class CurrentConstructorInfoVM: ObservableObject {
    let repository: CurrentConstructorRepositoryProtocol
    let repository2: ConstructorLastStdRepositoryProtocol
    @Published var constructorInfo: [CurrentConstructorInfo] = []
    @Published var constructorLastStd: [ConstructorLastStandingsList] = []
    @Published var errorMessage = ""
    
    init(repository: CurrentConstructorRepositoryProtocol = CurrentConstructorRepository.shared) {
        self.repository = repository
        self.repository2 = ConstructorLastStdRepository.shared
        Task {
            await fetchConstructorInfo()
            await fetchConstructorLastStd()
        }
    }
    
    @MainActor
    func fetchConstructorInfo() async {
        do {
            self.constructorInfo = try await repository.getCurrentConstructorInfo()
        } catch let error as NetworkErrors {
            errorMessage = error.localizedDescription
            constructorInfo = []
        } catch{
            constructorInfo = []
        }
    }
    
    @MainActor
    func fetchConstructorLastStd() async {
        do {
            self.constructorLastStd = try await repository2.getConstructorLastStd()
        } catch let error as NetworkErrors {
            errorMessage = error.localizedDescription
            print(error)
            self.constructorLastStd = []
        } catch {
            self.constructorLastStd = []
        }
    }
    
    func selectedConstructor(constructor: CurrentConstructorInfo) -> ConstructorLastStanding? {
        if let x = constructorLastStd.first {
            return x.constructorLastStandings.first(
                where: { $0.constructor.constructorID == constructor.constructorID })
        } else {
            return nil
        }
    }
}


