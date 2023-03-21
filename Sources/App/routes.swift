import Fluent
import Vapor

func routes(_ app: Application) throws {
//    app.group("cars") { cars in
//        cars.post("postCars") { req -> EventLoopFuture<Cars> in
//            let car = try req.content.decode(Cars.self)
//            return car.save(on: req.db).map { car }
//        }
//        
//        cars.get("allCars") { req -> EventLoopFuture<[Cars]> in
//            return Cars.query(on: req.db).with(\.$carsProviders).all()
//        }
//        
//        app.get(":getCarsId") { req -> EventLoopFuture<Cars> in
//            let id = try req.parameters.require("getCarsId", as: UUID.self)
//            return Cars.find(id, on: req.db)
//                .unwrap(or: Abort(.notFound))
//                .flatMap { car in
//                    car.$carsProviders.load(on: req.db).map { car }
//                }
//        }
//    }
//    
//   
//    app.group("carsUpdated") { cars in
//            app.put(":CarID") { req -> EventLoopFuture<HTTPStatus> in
//                let updateData = try req.content.decode(Cars.self)
////                guard let id = req.parameters.get("CarID", as: UUID.self) else {
////                    throw Abort(.badRequest)
////                }
////                updateData.id = id
//                return Cars.find(updateData.id, on: req.db)
//                    .unwrap(or: Abort(.notFound))
//                    .flatMap { car in
//                    car.brand = updateData.brand
//                    car.type = updateData.type
//                    car.year = updateData.year
//                    car.exteriorcolor = updateData.exteriorcolor
//                    car.innercolor = updateData.innercolor
//                    car.model = updateData.model
//                    car.catogray = updateData.catogray
//                    car.price = updateData.price
//                    car.$carsProviders.id = updateData.$carsProviders.id
//                  //  car.fueleconomy = updateData.fueleconomy
//                    car.fueltype = updateData.fueltype
//                    car.enginesize = updateData.enginesize
//                    car.gearType = updateData.gearType
//                    car.thenumberofcylinders = updateData.thenumberofcylinders
//                    car.safety = updateData.safety
//                    car.meansOfComfort = updateData.meansOfComfort
//                    car.carImage = updateData.carImage
//                  //  return car.save(on: req.db).map { car }
//                  //  return car.update(on: req.db).map { updateData }
//                    return car.update(on: req.db).transform(to: .ok)
//                }
//        }
//    }
//    
//    app.group("carsDeleted") { cars in
//        app.delete(":id") { req -> EventLoopFuture<HTTPStatus> in
//         //   let id = try req.parameters.require("CarID", as: UUID.self)
//            guard let id = req.parameters.get("id", as: UUID.self) else {
//                throw Abort(.badRequest)
//            }
//            return Cars.find(id, on: req.db)
//                .unwrap(or: Abort(.notFound))
//                .flatMap { car in
//                    return car.delete(on: req.db)
//            }.transform(to: .ok)
//        }
//        
//    }
//    //let cars = app.grouped("cars")
//    app.group("carsProvider") { carsProviderReq in
//        // Create a new CarsProvider
//        
//        carsProviderReq.post("postCarsProvider") { req -> EventLoopFuture<CarsProviders> in
//            let carsProvider = try req.content.decode(CarsProviders.self)
//            return carsProvider.save(on: req.db).map { carsProvider }
//        }
//        
//        // Get all CarsProviders
//        carsProviderReq.get("allCarsProvider") { req -> EventLoopFuture<[CarsProviders]> in
//            return CarsProviders.query(on: req.db).all()
//        }
//        carsProviderReq.get(":getCarProviderByID") { req -> EventLoopFuture<CarsProviders> in
//            guard let id = req.parameters.get("getCarProviderByID", as: UUID.self) else {
//                throw Abort(.badRequest)
//            }
//            return CarsProviders.find(id, on: req.db)
//                .unwrap(or: Abort(.notFound))
//        }
//    }
//    //  Get a single CarsProvider by id
//    
//    app.group("carsProviderUpdated") { cars in
//        // Update a CarsProvider by id
//        cars.put(":id") { req -> EventLoopFuture<CarsProviders> in
//            guard let id = req.parameters.get("id", as: UUID.self) else {
//                throw Abort(.badRequest)
//            }
//            let updatedCarsProvider = try req.content.decode(CarsProviders.self)
//            return CarsProviders.find(id, on: req.db)
//                .unwrap(or: Abort(.notFound))
//                .flatMap { carsProvider in
//                    carsProvider.email = updatedCarsProvider.email
//                    carsProvider.password = updatedCarsProvider.password
//                    carsProvider.phoneNumber = updatedCarsProvider.phoneNumber
//                    carsProvider.commercialRegister = updatedCarsProvider.commercialRegister
//                    carsProvider.profileImage = updatedCarsProvider.profileImage
//                    return carsProvider.update(on: req.db).map { updatedCarsProvider }
//                }
//        }
////        
//    }
//    app.group("carsProviderDeleted") { cars in
//        // Delete a CarsProvider by id
//        cars.delete(":id") { req -> EventLoopFuture<HTTPStatus> in
//            guard let id = req.parameters.get("id", as: UUID.self) else {
//                throw Abort(.badRequest)
//            }
//            return CarsProviders.find(id, on: req.db)
//                .unwrap(or: Abort(.notFound))
//                .flatMap { carsProvider in
//                    return carsProvider.delete(on: req.db)
//                }
//                .transform(to: .noContent)
//            
//        }
//    }
//    
//    
    try app.autoMigrate().wait()
    
    // or
    try app.register(collection: CarsProvidersController())
 //   let carsProvidersController = CarsProvidersController()
//    app.post("places", use: carsProvidersController.create)
//    app.get("places", use: carsProvidersController.index)
    try app.register(collection: CarsController())
 //   let carsController = CarsController()
//    app.post("cars", use: carsController.create)
//    app.get("cars", use: carsController.index)
    //    app.delete("cars", use: carsController.delete)
    //    app.patch("cars", use: carsController.update)
}









//
//    //    app.get { req async in
//    //          "It works!"
//    //      }
//    app.get("oldCar",":name") { req -> String in
//        let name = req.parameters.get("name")!
//        return "car name: , \(name)!"
//    }
//
//    app.group("cars") { cars in
//
//        cars.get("allCars") { Req in
//            return Cars(id: UUID(),brand: "", type: "", year: 0, exteriorcolor: "", innercolor: "", model: "", catogray: "", price: 0.0, fueleconomy: Fueleconomy(excellent: "", veryGood: "", good: "", average: "", poor: "", veryPoor: ""), fueltype: "", enginesize: "", gearType: "", thenumberofcylinders: "", safety: "", meansOfComfort: "", carImage: "")
//        }
//        cars.get("allCarsProviders") { Req in
//            return Cars(id: UUID(),brand: "", type: "", year: 0, exteriorcolor: "", innercolor: "", model: "", catogray: "", price: 0.0, fueleconomy: Fueleconomy(excellent: "", veryGood: "", good: "", average: "", poor: "", veryPoor: ""), fueltype: "", enginesize: "", gearType: "", thenumberofcylinders: "", safety: "", meansOfComfort: "", carImage: "")
//        }
//        cars.post("postCarsProvider") { Req in
//            let carsProviders = try Req.content.decode(CarsProviders.self)
//            print(carsProviders)
//            return carsProviders.create(on: Req.db).map {carsProviders}
//        }
//        cars.post("postCar") { Req in
//            let car = try Req.content.decode(Cars.self)
//            print(car)
//            return car.create(on: Req.db).map {car}
//        }
//        cars.get("cars") { req -> EventLoopFuture<View> in
//            let cars = Cars(id: UUID(),brand: "", type: "", year: 0, exteriorcolor: "", innercolor: "", model: "", catogray: "", price: 0.0, fueleconomy: Fueleconomy(excellent: "", veryGood: "", good: "", average: "", poor: "", veryPoor: ""), fueltype: "", enginesize: "", gearType: "", thenumberofcylinders: "", safety: "", meansOfComfort: "", carImage: "")
//            let context = ["cars": cars]
//            return req.view.render("cars", context)
//        }
//
//        cars.get(":name") { req -> String in
//            let name = req.parameters.get("name")!
//            return "car name inside group: , \(name)!"
//        }
//        //    PATCH /cars/:carID
//        cars.patch(":CarID", use: CarsController.update(CarsController.init()))
//
//        // DELETE /cars/:carID
//        cars.delete(":CarID", use: CarsController.delete(CarsController.init()))
//    }
//







//    app.get { req async in
//        "It works!"
//    }
//
//    app.get("hello") { req async -> String in
//        "Hello, world!"
//    }
//    app.get("hi") { req async -> String in
//        "hi, world!"
//    }
//    app.get("hello", ":name") { req -> String in
//        let name = req.parameters.get("name")!
//        return "Hello, \(name)!"
//    }
//    app.get("foo") { req async -> String in
//        return "bar"
//    }
//    try app.register(collection: TodoController())


//func routes(_ app: Application) throws {
//    let carController = CarController()
//    let cars = app.grouped("cars")
//
//    // GET /cars
//    cars.get(use: carController.getAllHandler)
//
//    // POST /cars
//    cars.post(use: carController.createHandler)
//
//    // GET /cars/:carID
//    cars.get(":carID", use: carController.getHandler)
//
//    // PATCH /cars/:carID
//    cars.patch(":carID", use: carController.updateHandler)
//
//    // DELETE /cars/:carID
//    cars.delete(":carID", use: carController.deleteHandler)
//}
