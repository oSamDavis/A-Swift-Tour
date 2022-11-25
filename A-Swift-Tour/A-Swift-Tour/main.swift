//
//  main.swift
//  A-Swift-Tour
//
//  Created by Sam Davis Omekara  on 11/19/22.
//

import Foundation

// Prints Hello World
print("Hello, World!")

// MARK: - 1. SIMPLE VALUES

// "let" creates constant while "var" creates variables.
let myConst = 20
var myVar = 18

// Specifiy data types as needed.
let myName: String = "Sam Davis"
let mySalaryPerHour: Double = 15.56

// MARK: - EXPERIMENT 1
// Create a constant with an explicit type of Float and a value of 4.
let myFloat: Float = 5.8


// Type conversion is not impilicit, rather you must
// explicitly make an instance of the desired type.
var myNameAndSalary: String = myName + ", Salary Per Hour: " + String(mySalaryPerHour)
print(myNameAndSalary)

// MARK: - EXPERIMENT 2
// Try removing the conversion to String from the line above, what error do you get?
// Error gotten: Cannot convert value of type 'Double' to expected argument type 'String'.


// String interpolation can be done using a backslash and parenthesis i.e. \().
let courses = 4
let extracurricular = 2
let semesterSummary = "I have \(courses) courses and \(extracurricular) extracurricular next semester."

// Three double parenthesis is used for multi line strings.
let reportedSpeech = """
Sam said,
"I have \(courses) courses and \(extracurricular) extracurricular activitites."
This brings his total commitments for the semester to about \(courses + extracurricular).
"""
// NB: multi-line literal must begin on a new line.


// Arrays and Dictionaries are created by using brackets i.e. []
var courseList = ["Spanish1", "Physics2", "Computer Org", "Capstone Proj."]
var extracurricularMap = [
    "CS Org": "President",
    "ISO": "Vice President"
]

// Access array elements by using its index, while values of dictionaries using its key.
print("Second course to be taken is ", courseList[1])
print("My role in CS Org is : ", extracurricularMap["CS Org"] ?? "Key Not Found" )

// Arrays automatically grow as you add elements.
courseList.append("Machine Learning")
print(courseList)

// To create an Empty Array or Dictionary use the initializer syntax
let emptyArray: [String] = []
let emptyDict: [String: Float] = [:]


// MARK: - 2. CONTROL FLOW

// Use if and switch to make conditionals.
// Use for-in, while and repeat-white to make loops.

let individualScores = [20, 45, 10, 53, 38, 79]
var teamScore = 0

for score in individualScores {
    if score > 45 {
        teamScore += 3
    }
    else {
        teamScore += 1
    }
}

// Expects to print 10
print(teamScore)

// Use if and let together to work with values that might be missing.
// An optional value either contains a value or "nil" to indicate the value is missing.
// Write a question mark ? after the type of a value to mark the value as optional.

var optionalDouble: Double? = 5.8
// Expect to print false
print(optionalDouble == nil)

var optionalName: String? = nil
var greeting = "Hi"

if let name = optionalName {
    greeting += ", \(name)"
}
else{
    greeting += ", Anon!"
}

print("Greeting: ", greeting)
// MARK: - EXPERIMENT 3
// Change optionalName to nil. What greeti g do you get? Add an else clause that sets a diff
// greeting if optionalName is nil.
// Behavior observed: The if block isn't executed. Else block added.

// Another way to handle optionals is by providing a default value using ?? operator.

let ssn: String? = nil
let defaultSsn = "999-99-9999"
let ssnInfo = "The user's social's are \(ssn ?? defaultSsn)"


// Switch statements aren't limited to just integers and tests for equality.
let veg = "red pepper"
switch veg {
case "peas":
    print("This is some peas")
case "cucumber", "lettuce":
    print("Put them in a salad")
case let x where x.hasSuffix("pepper"):
    print("Is \(x) very spicy ?")
default:
    print("Just add them in the sauce")
}

// MARK: - EXPERIMENT 4
// Try removing the default case. What error do you get?
// Error: Switch must be exhaustive

// NOTE: You don't need an explicit break in each case for switch statements

// Use a for in loop to iterate over items in the dictionary by providing a pair of names for each key-value pair

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]

var largest = 0
var largestCategory = ""

for (category, numbers) in interestingNumbers {
    for num in numbers {
        if num > largest{
            largest = num
            largestCategory = category
            
        }
            
    }
}

// Expect to print 25
print("Largest: ", largest)
print("Largest Category: ", largestCategory)

// MARK: - EXPERIMENT 5
// Replace the _ with a var name, and keep track of which kind of number was the largest.
// DONE.

// repeat-while ensures that the block is executed at least once.
// Ranges can be accessed using the ..< operator or ... operator.
// ..< - omits the over value ... includes the upper value


// MARK: - 3. Functions and Closures

// Use the func keyword to define a function.
// Use -> to seperate the params and types from the function's return type.

func greet(personName: String, day: String) -> String {
    return "Hi \(personName), hope you have a good \(day) !"
}

print(greet(personName: "Richard", day: "Sunday"))

// MARK: - EXPERIMENT 6
// Remove the day parameter. Add a parameter to include today's
// lunch special in the greeting.
func experimentGreet(person: String, todaySpecial: String) -> String {
    return "Hi \(person) , today's special is \(todaySpecial)"
}

// By default, functions use their param names as labels for their args
// Write a custome arg label before the param name
// Write _ to use no arg label

func greet1(_ person: String, on day: String) -> String {
    return "How far \(person), Blessed \(day) to you."
}

print(greet1("Peace", on: "Monday"))


// Use a tuple to make a compound value and return multiple values
// from a function.
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var minScore: Int = scores[0]
    var maxScore: Int = scores[0]
    var sum: Int = 0
    
    
    for score in scores {
        if score < minScore {
            minScore = score
        }
        if score > maxScore {
            maxScore = score
        }
        sum += score
    }
    
    return (minScore, maxScore, sum)
}

// The above function takes in a list of Integers and returns
// a tuple containing the min, max and sum from the list.

let statistics = calculateStatistics(scores: [5, 22, 34, 98, 65, 90])

// The elements of a tuple can be accessed either by name or by number.
print("Max accessed by name : ", statistics.max)
print("Max accessed by number: ", statistics.1)


// Functions can be nested. Nested functions have access to variables that
// were declared in the outer function.
func returnEighteen() -> Int {
    var y = 10
    func addEight(){
        y += 8
    }
    
    addEight()
    return y
}

var eighteen: Int = returnEighteen()
print("This is 18,", eighteen)

// Functions are a first-class type.
// Meaning that a function can return another function as its value.

func makeDecrementer() -> (Int, Int) -> Int {
    // Create a decrementer function.
    func decreaseByOne(num: Int, times: Int) -> Int {
        return num - times
    }
    
    return decreaseByOne   // return the decrementer function you created.
}

// create a var decrement and let it's value be whatever makeDecrementer returns
// (i.e a function)
var decrement = makeDecrementer()

// decrement is now a function that expects an integer, and decrements it by how much you want.
print(decrement(5, 7))
// Prints -2

// A function can take another function as an argument.
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item){
            return true
        }
    }
    
    return false
}

func isEven(num: Int) -> Bool {
    return num % 2 == 0
}

var nums = [7, 45, 59, 103]

print(hasAnyMatches(list: nums, condition: isEven))
// Prints false

// MARK: CLOSURE
// You can write a closure w/out a name by surrounding it with braces ({})
// Use in to separate the arguments and return type from the body.

let three_of_nums: [Int] = nums.map( { (num: Int) -> Int in
    let res = num * 3
    return res
})

print(three_of_nums)

// MARK: EXPERIMENT 6
// Rewrite the closure to return zero for all odd numbers.
let zeroes_for_odd = nums.map( { num in
    var res = []
    if num % 2 != 0{
        res.append(0)
    }
    return res
})

// To write closures more consisely, when the closure's type is already known
// such as a callback for a delegate, you can omit the type of its params and
// its return type.
// Single statement closures implicitly return the value of their only statement

let doubleNums  = nums.map( {num in
    num*2
})
print(doubleNums)
// Prints "[14, 90, 118, 206]"

// When a closure is the only argument to a func, you can omit the
// parantheses entirely.


// MARK: - 4 Objects and Classes

// Use class followed by the class's name to create a class.
// Ppty declaration is written in the same way as a constant or car declaration,
// except it's in the context of a class. Same go for methods and functions.

class Shape {
    var numberOfSides = 0
    let instrument = "Pencil"
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    func draw(times: Int) -> String {
        return "Drawing shape \(times) number of times with a \(instrument)"
    }
}


// MARK: EXPERIMENT 7
// Add a constant ppty with let, and add another method that takes an argument.
// Done: Added Instrument and draw

// Create a class by putting parentheses after the class name
// Use dot syntax to access the ppties and methods of the instance.

var shape = Shape()
shape.numberOfSides = 4
var shapeDescription = shape.simpleDescription()

// Use init to create an initializer (ctor in other langs)

class NamedShape {
    var numberOfSides : Int = 0
    var name: String
    
    init(name: String){
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}


// Every ppty of a class needs a value assigned:
// Either in Declaration (numberOfSides)
// Or in the initializer (name).

// Use denit to create a deinitializer to perform
// cleanup before an object is deallocated.

// SUbclasses include their superclass name after their
// class name, with a colon separating both names.
// Methods that override the superclass's implementation are marked
// with override.

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func perimeter() -> Double {
        return 4 * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with 4 sides, each of length \(sideLength)"
    }
}

let testShape = Square(sideLength: 50, name: "the test square")
print(testShape.perimeter()) // Prints 200
print(testShape.simpleDescription())


// MARK: - EXPERIMENT 8
// Make another subclass of NamedShape called Circle that takes a
// radius and a name as arguments to its initializer.
// Implement an area() and a simpleDescription() method on the
// Circle class.

class Circle: NamedShape{
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return (22.0/7.0) * radius * radius
    }
    
    override func simpleDescription() -> String {
        return "This is a circle called \(name), it's radius is \(radius) and it's area is \(area())"
    }
}

let testCircle = Circle(radius: 5, name: "the test circle")
print(testCircle.area())
print(testCircle.simpleDescription())


// Properties can have getters and setters.

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength // Setting the value of ppties that the subclass declares
        super.init(name: name)  // Calling the superclass' initializer
        numberOfSides = 3  //  Changing the value of ppties defined in the superclass
    }
    
    // Getter and setter of a ppty called perimeter
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        
        set {
            // setter's new Value has an implicit name newValue.
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
    
}

var triangle = EquilateralTriangle(sideLength: 5.6, name: "the triangle")
print(triangle.perimeter)
print(triangle.sideLength)

