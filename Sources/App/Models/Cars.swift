//
//  File.swift
//  
//
//  Created by Sara Alhumidi on 22/08/1444 AH.
//

import Foundation
import Vapor
import FluentKit
//import FluentBenchmark
final class Cars: Model, Content {
    static let schema = "Cars"
    
    
    @ID(key: .id)
    var id: UUID?
   
    @Parent(key: "CarsProvidersId")
    var carsProviders: CarsProviders
    
//الماركة
    @Field(key: "Brand")
    var brand: String
    //النوع
    @Field(key: "Type")
    var type: String
    //السنة
    @Field(key: "Year")
       var year: Int64
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
//    @Field(key: "Fueleconomy")
//    var fueleconomy: Fueleconomy
//    //نوع الوقود
    @Field(key: "Fueltype")
    var fueltype: String
    //حجم المحرك
    @Field(key: "EngineSize")
    var enginesize: String
    //نوع القير
    @Field(key: "GearType")
    var gearType: String
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

    init(id: UUID? = nil,brand: String ,carsProvidersId : UUID ,type: String,year: Int64 ,exteriorcolor: String,innercolor: String,model: String,catogray: String,price: Double,fueltype: String, enginesize: String, gearType: String,thenumberofcylinders: String,safety: String, meansOfComfort: String, carImage: String) {
        self.id = id
        self.brand = brand
        self.$carsProviders.id = carsProvidersId
        self.type = type
        self.year = year
        self.exteriorcolor = exteriorcolor
        self.innercolor = innercolor
        self.model = model
        self.catogray = catogray
        self.price = price
      //  self.fueleconomy = fueleconomy
        self.fueltype = fueltype
        self.enginesize = enginesize
        self.gearType = gearType
        self.thenumberofcylinders = thenumberofcylinders
        self.safety = safety
        self.meansOfComfort = meansOfComfort
        self.carImage = carImage
       
    }
}
