import Fluent
import Vapor

func routes(_ app: Application) throws {


//    app.get { req async in
//          "It works!"
//      }
    app.get("oldCar",":name") { req -> String in
        let name = req.parameters.get("name")!
        return "car name: , \(name)!"
    }
    
        app.group("cars") { cars in
        
        cars.get("all") { Req in
            return Cars(id: UUID(),brand: "", type: "", year: 0, exteriorcolor: "", innercolor: "", model: "", catogray: "", price: 0.0, fueleconomy: Fueleconomy(excellent: "", veryGood: "", good: "", average: "", poor: "", veryPoor: ""), fueltype: "", enginesize: "", asphalttype: "", thenumberofcylinders: "", safety: "", meansOfComfort: "", carImage: "")
        }
        cars.post("post") { Req in
            let car = try Req.content.decode(Cars.self)
            print(car)
            return car.create(on: Req.db).map {car}
        }
            cars.get("cars") { req -> EventLoopFuture<View> in
                let cars = Cars(id: UUID(),brand: "", type: "", year: 0, exteriorcolor: "", innercolor: "", model: "", catogray: "", price: 0.0, fueleconomy: Fueleconomy(excellent: "", veryGood: "", good: "", average: "", poor: "", veryPoor: ""), fueltype: "", enginesize: "", asphalttype: "", thenumberofcylinders: "", safety: "", meansOfComfort: "", carImage: "")
                let context = ["cars": cars]
                return req.view.render("cars", context)
            }

        cars.get(":name") { req -> String in
            let name = req.parameters.get("name")!
            return "car name inside group: , \(name)!"
        }
         //    PATCH /cars/:carID
            cars.patch(":carID", use: CarsController.update(CarsController.init()))
        
            // DELETE /cars/:carID
            cars.delete(":carID", use: CarsController.delete(CarsController.init()))
    }
    
    try app.autoMigrate().wait()

    // or
    try app.register(collection: CarsController())
        let carsController = CarsController()
    app.post("cars", use: carsController.create)
    app.get("cars", use: carsController.index)
//    app.delete("cars", use: carsController.delete)
//    app.patch("cars", use: carsController.update)
}

















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
