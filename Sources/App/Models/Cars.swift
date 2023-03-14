//
//  File.swift
//  
//
//  Created by Sara Alhumidi on 22/08/1444 AH.
//

import Foundation
import Vapor
import FluentKit
final class Cars: Model, Content {
    static let schema = "cars"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String
    @Field(key: "color")
    var color: String
    @Field(key: "model")
    var model: String
    @Field(key: "price")
    var price: Int

    init() { }

    init(id: UUID? = nil, name: String,color: String,model: String, price: Int) {
        self.id = id
        self.name = name
        self.color = color
        self.price = price
        self.model = model
    }
}
//struct ArticleCar: Content {
//    var name: String
//    var color: String
//    var model: String
//    var price: Int
//    var content: String
//}
