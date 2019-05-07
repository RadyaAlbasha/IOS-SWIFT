//
//  Movie.swift
//  CoreDataDemo
//
//  Created by JETS Mobile Lab - 2 on 5/7/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import Foundation
class MovieClass{
    var title = ""
    var releasData = 2000
    var rate : Float =  0.0
    init(title: String , releasData : Int , rate : Float){
        self.title = title
        self.releasData = releasData
        self.rate = rate
    }
}
