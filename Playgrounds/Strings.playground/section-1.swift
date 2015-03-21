// Playground - noun: a place where people can play

import UIKit

var string1 = ""
string1 = "Hello"
let string2 = "World"

var helloWorld = string1 + " " + string2
helloWorld = helloWorld.uppercaseString
helloWorld = helloWorld.lowercaseString

var firstCharacter = "!"

helloWorld = helloWorld + firstCharacter

var x = 5
var newString = "\(x)" + helloWorld

var floatValue = 3.5
var newFloatString = "\(floatValue)"


var numberString = "9"
var numberStringToInt = numberString.toInt()
var optionalToInt = numberStringToInt!
optionalToInt += 3

var doubleString = "3.9585"
var doubleValueFromString = Double((doubleString as NSString).doubleValue)
doubleValueFromString += 3.85






