/*:
## Exercise - Return Values

 Write a function called `greeting` that takes a `String` argument called name, and returns a `String` that greets the name that was passed into the function. I.e. if you pass in "Sophie" the return value might be "Hi, Sophie! How are you?" Use the function and print the result.
 */
func greeting(name: String)->String{
    let hello = "Hi, "
    let howRU = "! How are you?"
    return hello + name + howRU
}

let sayHello = greeting(name: "sam")
print(sayHello);
//:  Write a function that takes two `Int` arguments, and returns an `Int`. The function should multiply the two arguments, add 2, then return the result. Use the function and print the result.
func multiplyer(_ num1: Int, _ num2: Int)->Int{
    return num1 * num2 + 2
}
let product = multiplyer(3, 3)
print(product)
/*:
[Previous](@previous)  |  page 5 of 6  |  [Next: App Exercise - Separating Functions](@next)
 */
