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
//الماركة
    @Field(key: "Brand")
    var brand: String
    //النوع
    @Field(key: "Type")
    var type: String
    //السنة
    @Field(key: "Year")
       var year: Int
    ///لون خارجي
    @Field(key: "ExteriorColor")
    var exteriorcolor: String
    //لون داخلي
    @Field(key: "InteriorColor")
    var  innercolor: String
    //الموديل
    @Field(key: "Model")
    var model: String
    //الفئة
    @Field(key: "Catogray")
    var catogray: String
    //السعر
    @Field(key: "Price")
    var price: Double
      //اقتصاد الوقود
    @Field(key: "Fueleconomy")
    var fueleconomy: Fueleconomy
    //نوع الوقود
    @Field(key: "Fueltype")
    var fueltype: String
    //حجم المحرك
    @Field(key: "EngineSize")
    var enginesize: String
    //نوع القير
    @Field(key: "GearType")
    var asphalttype: String
    //عدد السلندرات
    @Field(key: "NumberOfCylinders")
    var thenumberofcylinders: String
    //الامان
    @Field(key: "Safety")
    var safety: String
    //وسائل الراحة
    @Field(key: "MeansOfComfort")
    var meansOfComfort: String
//صورة السيارة
    @Field(key: "CarImage")
    var carImage: String
    
    init() { }

    init(id: UUID? = nil,brand: String ,type: String,year: Int,exteriorcolor: String,innercolor: String,model: String,catogray: String,price: Double, fueleconomy: Fueleconomy,fueltype: String, enginesize: String, asphalttype: String,thenumberofcylinders: String,safety: String, meansOfComfort: String, carImage: String) {
        self.id = id
        self.brand = brand
        self.type = type
        self.year = year
        self.exteriorcolor = exteriorcolor
        self.innercolor = innercolor
        self.model = model
        self.catogray = catogray
        self.price = price
        self.fueleconomy = fueleconomy
        self.fueltype = fueltype
        self.enginesize = enginesize
        self.asphalttype = asphalttype
        self.thenumberofcylinders = thenumberofcylinders
        self.safety = safety
        self.meansOfComfort = meansOfComfort
        self.carImage = carImage
    }
}
final class Fueleconomy : Content  {
    var excellent : String
    var veryGood : String
    var good : String
    var average : String
    var poor : String
    var veryPoor : String
    init(excellent: String, veryGood: String, good: String, average: String, poor: String, veryPoor: String) {
        self.excellent = excellent
        self.veryGood = veryGood
        self.good = good
        self.average = average
        self.poor = poor
        self.veryPoor = veryPoor
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.excellent = try container.decode(String.self, forKey: .excellent)
        self.veryGood = try container.decode(String.self, forKey: .veryGood)
        self.good = try container.decode(String.self, forKey: .good)
        self.average = try container.decode(String.self, forKey: .average)
        self.poor = try container.decode(String.self, forKey: .poor)
        self.veryPoor = try container.decode(String.self, forKey: .veryPoor)
    }
}
