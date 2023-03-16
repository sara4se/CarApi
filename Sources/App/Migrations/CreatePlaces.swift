import Fluent

struct CreatePlaces: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("places")
            .id()
            .field("Citeis", .string, .required)
            .field("ShowRooms", .string, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("places").delete()
    }
}
