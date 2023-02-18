import UIKit

var greeting = "Hello, playground"




//Dictionary: Hashtale

var countryDetailsEmpty: [String: String] = [:]
var countryDetailsInitializes: [String: String] =
[
    "US": "United state",
    "IN":"India",
    "CN":"China",
    "CA":"Canada",
    "EN":"England"
]

print("\(countryDetailsInitializes["IN"])")
countryDetailsInitializes.removeValue(forKey: "EN")
countryDetailsInitializes.updateValue("Country India", forKey: "IN")

for (countryCode, CountryName) in countryDetailsInitializes {
    print("country Code = \(countryCode) - country Name = \(CountryName)")
}

// while loop
var i = 0
let endIndex = 5

while i < endIndex {
    print("I am here")
    i = i + 1
}

var age = 5
if age < 40 {
    print("You are young")
} else {
    print("you are experienced!")
}

// switch
let letter = "d"

switch letter {
case "a":
    print("a")
case "b":
    print("b")
case "e":
    print("e")
default:
    print("other letter")
}

//optional ? exclamation !
var myInt: Int?

//if let
if let val = myInt{
    let multipledBy5 = val * 5
    print(multipledBy5)
}

var myInt2: Int?
myInt2 = 5
if let val = myInt2{
    let multipledBy5 = val * 5
    print(multipledBy5)
}

//function

func greetWithName(firstName : String, lastName : String){
    print("Hello \(firstName),\(lastName)")
}

greetWithName(firstName: "Ashish",lastName: "Singh")

// using _ can ignore the argument name when using the function
func getFullName( _ firstName: String, _ lastName: String) -> String{
    return "\(firstName) \(lastName)"
}

print(getFullName("Xinyi", "Zhang"))


//inout: I'm passing in a same variable not a new variable
var a = 5
func incrementByOne(_ a: inout Int){
    a = a + 1;
}
// passing by reference??
incrementByOne(&a);
print("Value of a = \(a)")


//Structures
struct User {
    let firstName: String
    let lastName: String
    var age: Int
    
    func getFullName()-> String{
        return "\(firstName),\(lastName) "
    }
}

var ashish = User(firstName: "Ashish", lastName: "Singh", age:20)
print(ashish.getFullName())

// class
struct UserClass {
    let firstName: String
    let lastName: String
    var age: Int
    func getFullName()-> String{
        return "\(firstName),\(lastName) "
    }
    
    init(firstName : String, lastName : String, age : Int){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}

var billGates = UserClass(firstName:"Bill",lastName: "Gates", age:60)
print(billGates.getFullName())


//Enums (enumerate:to name a list of things one by one)

enum ColorEnum {
    case red
    case green
    case blue
}

print(ColorEnum.red)

enum IntEnum: Int {
    case one = 1
    case two = 2
    case three = 3
}

print(IntEnum.two.rawValue)

enum CityEnum: String{
    case DEL = "Delhi"
    case SEA = "Seattle"
}

print(CityEnum.DEL)
print(CityEnum.SEA.rawValue)

