//
//  File.swift
//  
//
//  Created by Sara Alhumidi on 22/08/1444 AH.
//
import Fluent
import Vapor

struct CarsController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let car = routes.grouped("cars")
        car.get(use: index)
        car.post(use: create)
        car.group(":carID") { car in
            car.delete(use: delete)
        }
    }
    func index(req: Request) async throws -> [Cars] {
        try await Cars.query(on: req.db).all()
    }

    func create(req: Request) async throws -> Cars {
        let car = try req.content.decode(Cars.self)
        try await car.save(on: req.db)
        return car
    }

    func delete(req: Request) async throws -> HTTPStatus {
        guard let car = try await Cars.find(req.parameters.get("carID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await car.delete(on: req.db)
        return .noContent
    }
    func update(req: Request)throws  -> EventLoopFuture<HTTPStatus>{
        let car = try req.content.decode(Cars.self)
        return Cars.find(car.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap{
                $0.name = car.name
                $0.model = car.model
                $0.price = car.price
                $0.color = car.color
                return $0.update(on: req.db).transform(to: .ok)
            }
        
    }
}
