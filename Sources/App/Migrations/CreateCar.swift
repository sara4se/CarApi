import Fluent

struct CreateCar: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("Cars")
            .id()
            .field("CarsProvidersId", .uuid, .required, .references("CarsProviders", "id"))
        //  .foreignKey("CarsProvidersId", references: "CarsProviders", inSpace: "CarsProviders", "CarsProvidersId")
        //.field("CarsProvidersId", .uuid, .required, .references("CarsProviders", "CarsProvidersId"))
            .field("Brand", .string, .required)
            .field("Type", .string, .required)
            .field("Year", .int64, .required)
            .field("ExteriorColor", .string, .required)
            .field("InteriorColor", .string, .required)
            .field("Model", .string, .required)
            .field("Catogray", .string, .required)
            .field("Price", .double, .required)
        //            .field("Fueleconomy", .date, .required)
           // .field("Fueleconomy_excellent", .string, .required)
      
            .field("Fueltype", .string, .required)
            .field("EngineSize", .string, .required)
            .field("GearType", .string, .required)
            .field("NumberOfCylinders", .string, .required)
            .field("Safety", .string, .required)
            .field("MeansOfComfort", .string, .required)
            .field("CarImage", .string, .required)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("Cars").delete()
    }
}


//    .field("Fueleconomy_veryGood", .string, .required)
//    .field("Fueleconomy_good", .string, .required)
//    .field("Fueleconomy_average", .string, .required)
//    .field("Fueleconomy_poor", .string, .required)
//    .field("Fueleconomy_veryPoor", .string, .required)
//self.id = id
//self.brand = brand
//self.$carsProviders.id = carsProvidersId
//self.type = type
//self.year = year
//self.exteriorcolor = exteriorcolor
//self.innercolor = innercolor
//self.model = model
//self.catogray = catogray
//self.price = price
////  self.fueleconomy = fueleconomy
//self.fueltype = fueltype
//self.enginesize = enginesize
//self.gearType = gearType
//self.thenumberofcylinders = thenumberofcylinders
//self.safety = safety
//self.meansOfComfort = meansOfComfort
//self.carImage = carImage
