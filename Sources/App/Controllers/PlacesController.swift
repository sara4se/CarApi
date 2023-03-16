import Fluent
import Vapor

struct PlacesController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let placeRouteGroupe = routes.grouped("places")
        placeRouteGroupe.get(use: index)
        placeRouteGroupe.post(use: create)
        placeRouteGroupe.group(":PlacesID") { place in
            place.delete(use: delete)
            place.patch(use: update)
        }
    }

    func index(req: Request) async throws -> [Places] {
        try await Places.query(on: req.db).all()
    }

    func create(req: Request) async throws -> Places {
        let places = try req.content.decode(Places.self)
        try await places.save(on: req.db)
        return places
    }

    func delete(req: Request) async throws -> HTTPStatus {
        guard let places = try await Places.find(req.parameters.get("PlacesID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await places.delete(on: req.db)
        return .noContent
    }
    func update(req: Request)throws  -> EventLoopFuture<HTTPStatus>{
        let places = try req.content.decode(Places.self)
        return Places.find(places.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap{
                $0.citeis = places.citeis
                $0.showRooms = places.showRooms
                
                
                return $0.update(on: req.db).transform(to: .ok)
            }
        
    }
     
}

