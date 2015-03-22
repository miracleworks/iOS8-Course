// Playground - noun: a place where people can play

import UIKit

//var tigerNames:Array<String>

//var tigerNames:[String]

var tigerNames = ["Tigger","Tigress","Jocob","Spar"]

var tigerAges = [3,2,4,5]


println("---------")


var emptyArray:[String] = []
if emptyArray.isEmpty {
    println("There are no elements in my array")
}
else
{
    println("There are elements in my array")
}

println(tigerNames.count)
println(emptyArray.count)

let firstNameFromArray = tigerNames[0]


println("---------")

for var i = 0; i < tigerNames.count; i++
{
    let intanceFromArray = tigerNames[i]
    println(intanceFromArray)
}

println("---------")

for tigerName in tigerNames{
    println(tigerName)
    
}

println("---------")

for x in 1...3
{
    println(x)
}


println("---------")

for (index, tigerName) in enumerate(tigerNames)
{
    println("index: \(index) tigerName: \(tigerName)")
}

println("---------")













