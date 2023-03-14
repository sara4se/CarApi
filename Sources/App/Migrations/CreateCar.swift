import Fluent

struct CreateCar: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("cars")
            .id()
            .field("name", .string, .required)
            .field("color", .string, .required)
            .field("model", .string, .required)
            .field("price", .int64, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("cars").delete()
    }
}
