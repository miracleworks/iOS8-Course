// Playground - noun: a place where people can play

import UIKit


func printHelloWorld() {
    println("Hello World")
    println("Hello Class")
}

printHelloWorld()


println("-----")


func PrintNumberSupplied(number : Int)
{
    println("The number \(number)")
    println("The number times 3 is \(number * 3)")
    var numberTimesTwo = number * 2
    numberTimesTwo *= 2
}

PrintNumberSupplied(3)


println("------")


// function returning value
func additionFunction(firstArgument: Int, secondArgument: Int) -> Int
{
    let sumOfArguments = firstArgument + secondArgument
    
    return sumOfArguments
}

println(additionFunction(1, 2))

println("------")

func HelloWorldString() -> String
{
    
    
    return "Hello World"
}

var helloWorld = HelloWorldString()
helloWorld = helloWorld + "!"
println(helloWorld)













