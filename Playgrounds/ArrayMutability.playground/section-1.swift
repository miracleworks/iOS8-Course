// Playground - noun: a place where people can play

import UIKit

var tigerNames = ["Tigger","Tigress"]

// add instance
tigerNames.append("Jacob")
println(tigerNames)

// add instances
tigerNames += ["John","Eliot"]
println(tigerNames)

// replace single instance
tigerNames[1] = "Spar"
println(tigerNames)

// replace a range of instances
tigerNames[0...2] = ["Katie","James","George"]
println(tigerNames)

// insert instance at an index
tigerNames.insert("Julie", atIndex:1)
println(tigerNames)

// remove instance at end
tigerNames.removeLast()
println(tigerNames)

//remove instance at an index
tigerNames.removeAtIndex(1)
println(tigerNames)

// free up memory
tigerNames.removeAll(keepCapacity: false)

println(tigerNames)





