//
//  File.swift
//  
//
//  Created by eman alejilah on 26/08/1444 AH.
//

import Fluent
import Vapor

final class CarsProviders: Model, Content {
    static let schema = "CarsProviders"
    
    @ID(key: .id)
    var id: UUID?
    //
    @Field(key: "Email")
    var email: String
    //
    @Field(key: "Password")
    var password: Int64
    
    @Field(key: "PhoneNumber")
    var phoneNumber: Int64
    
    @Field(key: "CommercialRegister")
    var commercialRegister: Int64
    
    @Field(key: "ProfileImage")
    var profileImage: String
    
//    @Field(key: "lat")
//    var lat: String
//
//    @Field(key: "long")
//    var long: String
    
    init() { }

    init(id: UUID? = nil, email: String, password: Int64 ,commercialRegister: Int64 , phoneNumber: Int64 ,profileImage: String ) {
        self.id = id
        self.email = email
        self.password = password
        self.phoneNumber = phoneNumber
        self.commercialRegister = commercialRegister
        self.profileImage = profileImage
    }
}
 

