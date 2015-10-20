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
var Jack = Person(firstName: "Jack", lastName: "Johns", age: 23, spouse: nil, job: myJob)
print(Jack.toString())


var Mary = Person(firstName: "Mary", lastName: "Johns", age: 21, spouse: Jack, job: myJob)
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





// Extension Double: convert a double value into a Money using self as the amount
extension Double {
    var USD: Money {return Money(currency: "USD", amount: self)}
    var EUR: Money {return Money(currency: "EUR", amount: self)}
    var GBP: Money {return Money(currency: "GBP", amount: self)}
    var CAN: Money {return Money(currency: "CAN", amount: self)}
}
print("")
print("Extension: Double Tests:")
print("\"1200.USD\" returns \(1200.USD)")
print("\"2000.EUR.add(300.USD)\" returns \(2000.EUR.add(300.USD))")


// New protocol added: returns human readable version of contents
protocol CustomStringConvertible {
    var description : String { get }
}
print("")
print("CustomStringConvertible Tests:")
print("\"1200.USD.description\" returns: \(1200.USD.description)")
print("\"myJob.description\" returns: \(myJob.description)")
print("\"Jack.description\" returns: \(Jack.description)")
print("\"newFamily.description\" returns: \(newFamily.description)")


// New protocol added: Mathematics (+,-)
print(myMoney.addMoney(myMoney2))
print(myMoney.addMoney(myMoney2).description)
print(myMoney.subMoney(myMoney2))
print(myMoney.subMoney(myMoney2).description)
