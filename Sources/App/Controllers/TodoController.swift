import Fluent
import Vapor

struct TodoController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let todos = routes.grouped("todos")
        todos.get(use: index)
        todos.post(use: create)
        todos.group(":todoID") { todo in
            todo.delete(use: delete)
        }
    }

    func index(req: Request) async throws -> [Todo] {
        try await Todo.query(on: req.db).all()
    }

    func create(req: Request) async throws -> Todo {
        let todo = try req.content.decode(Todo.self)
        try await todo.save(on: req.db)
        return todo
    }

    func delete(req: Request) async throws -> HTTPStatus {
        guard let todo = try await Todo.find(req.parameters.get("todoID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await todo.delete(on: req.db)
        return .noContent
    }
    func update(req: Request)throws  -> EventLoopFuture<HTTPStatus>{
        let todo = try req.content.decode(Todo.self)
        return Todo.find(todo.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap{
                $0.title = todo.title
                return $0.update(on: req.db).transform(to: .ok)
            }
        
    }
     
}
