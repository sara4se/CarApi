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
            return Cars(id: UUID(),name: "camery", color: "red", model: "2001", price: 12)
        }
        cars.post("post") { Req in
            let car = try Req.content.decode(Cars.self)
            print(car)
            return car
        }
        cars.get(":name") { req -> String in
            let name = req.parameters.get("name")!
            return "car name inside group: , \(name)!"
        }
        
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
    try app.register(collection: CarsController())
        let carsController = CarsController()
    app.post("cars", use: carsController.create)
    app.get("cars", use: carsController.index)
//    app.delete("cars", use: carsController.delete)
//    app.patch("cars", use: carsController.update)
}
