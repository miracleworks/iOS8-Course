// Playground - noun: a place where people can play

import UIKit


var myTuple = ("Tigfer","Bengal",3)
let name = myTuple.0

var secondTigerTuple = (name:"Tigress", breed: "Indochinese Tiger",age: 2)
let age = secondTigerTuple.age


switch secondTigerTuple
{
case ("Tigress","Malayan",2):
    println("first case is true")
case (_,"Indochinese Tiger", _):
    println("Second case is true")
default:
    println("Default is occuring")
}





