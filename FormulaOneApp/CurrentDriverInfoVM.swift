//
//  CurrentDriverInfoVM.swift
//  FormulaOneApp
//
//  Created by Ruben Alonso on 23/12/23.
//

import Foundation

final class CurrentDriverInfoVM: ObservableObject {
    let repository: CurrentDriverInfoRepositoryProtocol
    let repository2: DriverLastStdRepositoryProtocol
    @Published var driverInfo: [CurrentDriverInfo] = []
    @Published var driverLastStd: [DriverLastStandingsList] = []
    @Published var errorMessage = ""
    
    init(repository: CurrentDriverInfoRepositoryProtocol = CurrentDriverInfoRepository.shared) {
        self.repository = repository
        self.repository2 = DriverLastStdRepository.shared
        Task {
            await fetchDriverInfo()
            await fetchDriverLastStd()
        }
    }
    
    @MainActor
    func fetchDriverInfo() async {
        do {
            self.driverInfo = try await repository.getCurrentDriverInfo()
        } catch let error as NetworkErrors {
            errorMessage = error.localizedDescription
            driverInfo = []
        } catch {
            driverInfo = []
        }
    }
    
    @MainActor
    func fetchDriverLastStd() async {
        do {
            self.driverLastStd = try await repository2.getDriverLastStd()
        } catch let error as NetworkErrors {
            errorMessage = error.localizedDescription
            driverLastStd = []
        } catch {
            driverLastStd = []
        }
    }
    
    func selectedDriver(driver: CurrentDriverInfo ) -> DriverLastStanding? {
        if let x = driverLastStd.first {
            return x.driverLastStandings.first(where: { $0.driver.driverID == driver.driverID })
        } else {
            return nil
        }
    }
}
