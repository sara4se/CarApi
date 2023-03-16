import Fluent

struct CreateCar: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("cars")
            .id()
            .field("Brand", .string, .required)
            .field("Type", .string, .required)
            .field("Year", .int64, .required)
            .field("ExteriorColor", .int64, .required)
            .field("InteriorColor", .string, .required)
            .field("Model", .int64, .required)
            .field("Catogray", .string, .required)
            .field("Price", .double, .required)
            .field("Fueleconomy", .date, .required)
            .field("Fueltype", .string, .required)
            .field("EngineSize", .int64, .required)
            .field("GearType", .int64, .required)
            .field("NumberOfCylinders", .int64, .required)
            .field("Safety", .int64, .required)
            .field("MeansOfComfort", .int64, .required)
            .field("CarImage", .int64, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("cars").delete()
    }
}
