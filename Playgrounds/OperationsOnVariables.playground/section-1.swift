// Playground - noun: a place where people can play

import UIKit

typealias WholeNumber = Int
typealias NumberWithDecimal = Double

var x:WholeNumber = 49
var y = 10

var additionAnswer = x + y
var multiplicationAnswer = x * y
var subtractionAnswer = x - y
var divisionAnswer = x / y


var discountOnShoesAtStore = 0.3
var priceOfShoes:NumberWithDecimal = 33

var priceAfterDiscount = priceOfShoes * (1.0 - discountOnShoesAtStore)
var downPayment = 10.5
priceAfterDiscount = priceAfterDiscount - downPayment

var largeNumber = 1_000_000_0000_000


// testing optional
var textNumber = "3"
var optionalIntNumber = textNumber.toInt()
var intNumber:Int = optionalIntNumber!



