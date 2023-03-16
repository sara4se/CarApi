//
//  File.swift
//  
//
//  Created by Sara Alhumidi on 24/08/1444 AH.
//

import Fluent
import Vapor

final class Places: Model, Content {
    static let schema = "pleaces"
    
    @ID(key: .id)
    var id: UUID?
    //
    @Field(key: "Citeis")
    var citeis: String
    //
    @Field(key: "ShowRooms")
    var showRooms: String
    
//    @Field(key: "lat")
//    var lat: String
//
//    @Field(key: "long")
//    var long: String
    
    init() { }

    init(id: UUID? = nil, citeis: String, showRooms: String) {
        self.id = id
        self.citeis = citeis
        self.showRooms = showRooms
    }
}
 
