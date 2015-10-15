//
//  person.swift
//  domain-modeling
//
//  Created by Yuyang Fan on 10/13/15.
//  Copyright © 2015 Yuyang Fan. All rights reserved.
//

import Foundation

class Person {
    let firstName : String
    let lastName : String
    let age : Int
    var spouse : Person?
    var job : Job?
    
    init(firstName: String, lastName: String, age: Int, spouse: Person?, job: Job?) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        if (age >= 16) {
            self.job = job
        }else {
            self.job = nil
        }
        if (age >= 18) {
            self.spouse = spouse
        }else {
            self.spouse = nil
        }
    }
    
    func toString () -> String{
        if(self.job != nil && self.spouse != nil){
            return "FirstName: \(firstName), LastName:\(lastName), age:\(age), Spouse:\(spouse!.firstName), Job:\(job!.title)"
        }else if (self.job == nil && self.spouse != nil){
            return "FirstName: \(firstName), LastName:\(lastName), age:\(age), Spouse:\(spouse!.firstName), Job: None"
        }else if (self.job != nil && self.spouse == nil) {
            return "FirstName: \(firstName), LastName:\(lastName), age:\(age), Spouse: None, Job:\(job!.title)"
        }else {
            return "FirstName: \(firstName), LastName:\(lastName), age:\(age), Spouse: None, Job: None"
        }
        
    }
    
}