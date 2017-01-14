//
//  profileDataModel.swift
//  Fundo
//
//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class profileDataModel: NSObject {
    
    var diploma:String?
    var degree:String?
    var discipline:String?
    var yearOfPassing:String?
    var aggregate:String?
    var finalYearPercentage:String?
    var trainingInstitute:String?
    var trainingDuration:String?
    var training:String?
    
    init(diplomaVar:String,degreeVar:String,disciplineVar:String,yop:String,aggregateVar:String,finalyearPercentagevar:String,trainingInstVar:String,trainingDurationVar:String,trainingVar:String) {
        
        self.diploma = diplomaVar
        self.degree = degreeVar
        self.discipline = disciplineVar
        self.yearOfPassing = yop
        self.aggregate = aggregateVar
        self.finalYearPercentage = finalyearPercentagevar
        self.trainingInstitute = trainingInstVar
        self.trainingDuration = trainingDurationVar
        self.training = trainingVar
        
    }

}
