//
//  File.swift
//  
//
//  Created by eman alejilah on 26/08/1444 AH.
//

import Fluent
import Vapor

struct CarsProvidersController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let CarsProvidersRouteGroupe = routes.grouped("carsProviders")
        CarsProvidersRouteGroupe.get(use: index)
        CarsProvidersRouteGroupe.post(use: create)
        CarsProvidersRouteGroupe.delete(":id", use: delete)
        CarsProvidersRouteGroupe.put(":id", use: update)
    }

    func index(req: Request) async throws -> [CarsProviders] {
        try await CarsProviders.query(on: req.db).all()
    }

    func create(req: Request) async throws -> CarsProviders {
        let carsProviders = try req.content.decode(CarsProviders.self)
        try await carsProviders.save(on: req.db)
        return carsProviders
    }

    func delete(req: Request) async throws -> HTTPStatus {
        guard let carsProviders = try await CarsProviders.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await carsProviders.delete(on: req.db)
        
        return .noContent
    }
    func update(req: Request)throws  -> EventLoopFuture<HTTPStatus>{
        let updatedCarsProvider = try req.content.decode(CarsProviders.self)
        return CarsProviders.find(updatedCarsProvider.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap{
                $0.email = updatedCarsProvider.email
                $0.password = updatedCarsProvider.password
                $0.phoneNumber = updatedCarsProvider.phoneNumber
                $0.commercialRegister = updatedCarsProvider.commercialRegister
                $0.profileImage = updatedCarsProvider.profileImage
                
                
                return $0.update(on: req.db).transform(to: .ok)
            }
    }
}


