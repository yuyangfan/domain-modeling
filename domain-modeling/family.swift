//
//  family.swift
//  domain-modeling
//
//  Created by Yuyang Fan on 10/13/15.
//  Copyright © 2015 Yuyang Fan. All rights reserved.
//

import Foundation

class Family : CustomStringConvertible{
    var members : [Person]
    
    init (members: [Person]) {
        self.members = members
    }
    
    
    
    func householdIncome() -> Double{
        var total : Double = 0
        for member in members {
            if (member.job != nil) {
                let income = member.job!.calculateIncome(2087)
                total += income
            }
            
        }
        return total
    }
    
    func haveChild(){
        for member in members {
            if (member.age > 21) {
                members.append(Person(firstName: "newBaby", lastName: member.lastName, age: 0, spouse: nil, job: nil))
                print("A new baby has joined this family.")
                break
            }else {
                print("This family is illegal to have child.")
            }
        }
       
    }
    
    var description : String {
        var list : String = ""
        for (var i = 0; i < newFamily.members.count; i++) {
            let name = newFamily.members[i].firstName + " " + newFamily.members[i].lastName
            list += ("\(i+1). \(name) ")
            
        }
        return list
    }
}