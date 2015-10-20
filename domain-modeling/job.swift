//
//  job.swift
//  domain-modeling
//
//  Created by Yuyang Fan on 10/13/15.
//  Copyright © 2015 Yuyang Fan. All rights reserved.
//

import Foundation



class Job : CustomStringConvertible {
    
    enum SalaryType {
        case perHour
        case perYear
    }
    
    let title: String
    var salary: Double
    let salaryType: SalaryType
    
   
    
    init(title: String, salary: Double, salaryType: SalaryType) {
        self.title = title
        self.salary = salary
        self.salaryType = salaryType

    }
    
    // accepts a number of hours worked this year and returns total salary, returns year salary if type is perYear
    func calculateIncome(hoursWorked: Double) -> Double {
        if (self.salaryType == SalaryType.perHour) {
            return salary * hoursWorked
        }else {
            return salary
        }
    }
    
    // raise salary with given percentage
    func raise(percent: Double) -> Double {
        let newSalary = salary * (percent/100) + salary
        return newSalary
    }
    
    var description : String {
        return ("\(self.title) $\(self.salary) \(self.salaryType)" )
    }

}