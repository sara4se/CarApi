import Fluent
import Vapor

func routes(_ app: Application) throws {

    try app.autoMigrate().wait()
    try app.register(collection: CarsProvidersController())
    try app.register(collection: CarsController())
}
