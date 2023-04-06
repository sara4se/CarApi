import Fluent
import FluentPostgresDriver
import Vapor
import Leaf
// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    if let urlString = Environment.get("DATABASE_URL"),
       var postgresConfig = PostgresConfiguration(url: urlString){
        var tlsConfig = TLSConfiguration.makeClientConfiguration()
        tlsConfig.certificateVerification = .none
        postgresConfig.tlsConfiguration = tlsConfig
        app.databases.use(.postgres(configuration: postgresConfig), as: .psql)
    }
    else{
        app.databases.use(.postgres(
            hostname: Environment.get("DATABASE_HOST") ?? "localhost",
            port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? PostgresConfiguration.ianaPortNumber,
            username: Environment.get("DATABASE_USERNAME") ?? "sara",
            password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
            database: Environment.get("DATABASE_NAME") ?? "vapordb"
        ), as: .psql)
     
        
    }
    app.views.use(.leaf)
    app.migrations.add([CreateCarsProviders(),CreateCar()])
    //app.migrations.add(CreateCar())
    if app.environment == .development{
        try app.autoMigrate().wait()}
    // register routes
    try routes(app)
}
