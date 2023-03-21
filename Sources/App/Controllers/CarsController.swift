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
        car.delete(":id",use: delete)
        car.put(":id",use: update)
        
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
        guard let car = try await Cars.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await car.delete(on: req.db)
        return .noContent
    }
 
    func update(req: Request)throws  -> EventLoopFuture<HTTPStatus>{
//        let carID = try req.parameters.require("CarID", as: UUID.self)
        let car = try req.content.decode(Cars.self)
        return Cars.find(car.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap{
                $0.brand = car.brand
                $0.type = car.type
                $0.year = car.year
                $0.exteriorcolor = car.exteriorcolor
                $0.innercolor = car.innercolor
                $0.model = car.model
                $0.catogray = car.catogray
                $0.price = car.price
                $0.$carsProviders.id = car.$carsProviders.id
              //  $0.fueleconomy = car.fueleconomy
                $0.fueltype = car.fueltype
                $0.enginesize = car.enginesize
                $0.gearType = car.gearType
                $0.thenumberofcylinders = car.thenumberofcylinders
                $0.safety = car.safety
                $0.meansOfComfort = car.meansOfComfort
                $0.carImage = car.carImage
                return $0.update(on: req.db).transform(to: .ok)
                
            }
    }
}
 
//struct CarController: RouteCollection {
//    func boot(routes: RoutesBuilder) throws {
//        let cars = routes.grouped("cars")
//        cars.get(use: getAllHandler)
//        cars.post(use: createHandler)
//        cars.group(":carID") { car in
//            car.get(use: getHandler)
//            car.put(use: updateHandler)
//            car.delete(use: deleteHandler)
//        }
//    }
//
//    func getAllHandler(_ req: Request) throws -> EventLoopFuture<[Car]> {
//        return Car.query(on: req.db).all()
//    }
//
//    func createHandler(_ req: Request) throws -> EventLoopFuture<Car> {
//        let car = try req.content.decode(Car.self)
//        return car.create(on: req.db).map { car }
//    }
//
//    func getHandler(_ req: Request) throws -> EventLoopFuture<Car> {
//        let carID = try req.parameters.require("carID", as: UUID.self)
//        return Car.find(carID, on: req.db)
//            .unwrap(or: Abort(.notFound))
//    }
//
//    func updateHandler(_ req: Request) throws -> EventLoopFuture<Car> {
//        let carID = try req.parameters.require("carID", as: UUID.self)
//        let input = try req.content.decode(Car.self)
//        return Car.find(carID, on: req.db)
//            .unwrap(or: Abort(.notFound))
//            .flatMap { car in
//                car.make = input.make
//                car.model = input.model
//                car.year = input.year
//                car.color = input.color
//                car.price = input.price
//                car.mileage = input.mileage
//                car.fuelType = input.fuelType
//                car.transmission = input.transmission
//                car.numberOfOwners = input.numberOfOwners
//                car.accidentHistory = input.accidentHistory
//                car.serviceHistory = input.serviceHistory
//                return car.update(on: req.db).map { car }
//            }
//    }
//
//    func deleteHandler(_ req: Request) throws -> EventLoopFuture<HTTPStatus> {
//        let carID = try req.parameters.require("carID", as: UUID.self)
//        return Car.find(carID, on: req.db)
//            .unwrap(or: Abort(.notFound))
//            .flatMap { car in
//                car.delete(on: req.db)
//                    .transform(to: .noContent)
//            }
//    }
//}
