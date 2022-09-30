//
//  Planet.swift
//  planetsRetry
//
//  Created by Matthew Rawlings on 9/24/22.
//

import Foundation

class Planet {
    let name: String
    let planetDescription: String
    let imageName: String
    let orderNumber: Int
    let dayLengthInDays: Double
    let yearLengthInDays: Int
    let radiusInMiles: Double
    let moonCount: Int
    let ringCount: Int
    let planetType: String
    let distanceFromSun: Double
    var favorite: Bool
    
    internal init(planetName: String, namesake: String, imageName: String, orderNumber: Int, dayLengthInEarthDays: Double, yearLengthInDays: Int, radiusMiles: Double, moonCount: Int, ringCount: Int, planetType: String, distanceFromSun: Double, favorite: Bool) {
        
        self.name = planetName
        self.planetDescription = namesake
        self.imageName = imageName
        self.orderNumber = orderNumber
        self.dayLengthInDays = dayLengthInEarthDays
        self.yearLengthInDays = yearLengthInDays
        self.radiusInMiles = radiusMiles
        self.moonCount = moonCount
        self.ringCount = ringCount
        self.planetType = planetType
        self.distanceFromSun = distanceFromSun
        self.favorite = favorite
    }
}

enum PlanetType: String {
    case iceGiant = "Ice Giant"
    case gasGiant = "Gas Giant"
    case terrestrial = "Terrestrial"
}

enum PlanetOrder: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
