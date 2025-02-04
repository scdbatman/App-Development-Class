/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
let newArray: [Any] = [3,4.65, "What the", 4.4, 9, true, "haha"]
print(newArray)
//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for i in newArray {
    if let number = i as? Int {
        print(i)
    }
    
}
for i in newArray {
    if let number = i as? String {
        print(i)
    }
}
for i in newArray {
    if let number = i as? Bool {
        print(i)
    }
}
for i in newArray {
    if let number = i as? Double {
        print(i)
    }
}
//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
let newDictionary: [String: Any] = ["haha": "funny", "blah": 0.5, "stuck": true, "haters mad": true, "the end": 500, "the start": 20, "alskdjf": 0.5, "word or number": "500"]
for (key, value) in newDictionary {
    if let word = value as? Any {
        print(word)
    }
}
print("break")

//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total: Double = 0
for (key, value) in newDictionary {
    if let word = value as? String {
        total += 1
    }
    if let number = value as? Int {
        total += Double(number)
    }
    if let booleanValue = value as? Bool {
        if booleanValue {
            total += 2
        }else {
            total -= 3
        }
    }
    if let decimal = value as? Double {
        total += decimal
    }
}
print(total)
print("break")

//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
var total2: Double = 0
for (key, value) in newDictionary {
    if let word = value as? String {
        if let number = Double(word) {
            total2 += number
        }

    }
    if let number = value as? Int {
        total2 += Double(number)
    }

    if let decimal = value as? Double {
        total2 += decimal
    }
}
print(total2)
/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
