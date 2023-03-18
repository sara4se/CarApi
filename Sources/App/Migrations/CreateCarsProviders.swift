//
//  File.swift
//  
//
//  Created by eman alejilah on 26/08/1444 AH.
//

import Foundation
import Fluent

struct CreateCarsProviders: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("CarsProviders")
            .id()
            .field("Email", .string, .required)
            .field("Password", .int64, .required)
            .field("PhoneNumber", .int64, .required)
            .field("CommercialRegister", .int64, .required)
            .field("ProfileImage", .string, .required)
            .create()
    }
    


    func revert(on database: Database) async throws {
        try await database.schema("CarsProviders").delete()
    }
}
