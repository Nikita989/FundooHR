//
//  profileDataModel.swift
//  Fundo

//  purpose:
//  1. model class for profile data

//  Created by BridgeLabz Solution LLP on 04/01/17.
//  Copyright © 2017 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class ProfileDataModel: NSObject {
    
    // variable of type string to store profile data values
    var mDiploma:String?
    var mDegree:String?
    var mDiscipline:String?
    var mYearOfPassing:String?
    var mAggregate:String?
    var mFinalYearPercentage:String?
    var mTrainingInstitute:String?
    var mTrainingDuration:String?
    var mTraining:String?
    
    
    // constructor of profile DataModel
    init(diplomaVar:String,degreeVar:String,disciplineVar:String,yop:String,aggregateVar:String,finalyearPercentagevar:String,trainingInstVar:String,trainingDurationVar:String,trainingVar:String) {
        
        self.mDiploma = diplomaVar
        self.mDegree = degreeVar
        self.mDiscipline = disciplineVar
        self.mYearOfPassing = yop
        self.mAggregate = aggregateVar
        self.mFinalYearPercentage = finalyearPercentagevar
        self.mTrainingInstitute = trainingInstVar
        self.mTrainingDuration = trainingDurationVar
        self.mTraining = trainingVar
        
    }
    
}
