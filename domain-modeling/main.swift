//
//  main.swift
//  domain-modeling
//
//  Created by Yuyang Fan on 10/13/15.
//  Copyright © 2015 Yuyang Fan. All rights reserved.
//

import Foundation


var myMoney : Money = Money(currency: "USD", amount: 1000)
print(myMoney)
var myMoney4 : Money = Money(currency: "USD", amount: 666)
var myMoney5 : Money = Money(currency: "USD", amount: 333)
myMoney = myMoney.convertTo("GBP")
//print(myMoney)

var myMoney2 = myMoney.convertTo("CAN")
print(myMoney2)


var myMoney3 = myMoney.convertTo("EUR")
print(myMoney3)

myMoney = myMoney.add(myMoney4)
print(myMoney)
myMoney = myMoney.subtract(myMoney5)
myMoney = myMoney.convertTo("USD")
print(myMoney)

print("")
var myJob = Job(title: "Student", salary: 30, salaryType: .perHour)
myJob.salary = myJob.raise(30)
print(myJob.title, myJob.salary, myJob.salaryType)
let income = myJob.calculateIncome(400)
print("My total income is $\(income)")

print("")
var Jack = Person(firstName: "Jack", lastName: "Work", age: 23, spouse: nil, job: myJob)
print(Jack.toString())


var Mary = Person(firstName: "Mary", lastName: "Work", age: 21, spouse: Jack, job: myJob)
print(Mary.toString())

print("")
var newFamily = Family(members: [Jack,Mary])


print("there are \(newFamily.members.count) people in this family now")
newFamily.haveChild()

print("there are \(newFamily.members.count) people in this family now")

print("")
print("list of family members: ")
for (var i = 0; i < newFamily.members.count; i++) {
    var name = newFamily.members[i].firstName + " " + newFamily.members[i].lastName
    print("\(i+1). \(name)")
}

