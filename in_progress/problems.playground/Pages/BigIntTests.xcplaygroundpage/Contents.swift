//: [Previous](@previous)

//Big Int Init
let ten = BigInt(integer: 10)
print(ten.digits == [1, 0])
print(ten.base == 10)

//Equality
print(ten == ten)

let nine = BigInt(integer: 9)
print(nine != ten)

//Addition
let one = BigInt(integer: 1)
let onePlusNine = one.add(nine)
print(onePlusNine == BigInt(integer: 10))

let oneHundredNine = BigInt(integer: 109)

let ninePlusOneHundredNine = nine.add(oneHundredNine)
print(ninePlusOneHundredNine == BigInt(integer: 118))

//Multiply
let oneTimesNine = one.multiply(nine)
print(oneTimesNine == BigInt(integer: 9))

let oneTimesTen = one.multiply(ten)
print(oneTimesTen == BigInt(integer: 10))

let nineTimesNine = nine.multiply(nine)
print(nineTimesNine == BigInt(integer: 81))

let eightyFour = BigInt(integer: 84)
let oneSeventyEight = BigInt(integer: 178)
let eightyFourTimesOneSeventyEight = eightyFour.multiply(oneSeventyEight)
print(eightyFourTimesOneSeventyEight == BigInt(integer: 14952))

//Digits Using Base
print(123.digitsUsingBase(10) == [1, 2, 3])
print(0.digitsUsingBase(10) == [0])
print(10.digitsUsingBase(10) == [1, 0])
print(100.digitsUsingBase(10) == [1, 0, 0])

//: [Next](@next)
