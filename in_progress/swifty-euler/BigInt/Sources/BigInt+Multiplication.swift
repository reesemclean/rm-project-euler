public extension BigInt {
    
    public func multiply(other: BigInt) -> BigInt {
        
        guard self.base == other.base else { fatalError("Only multipling BigInts with equal bases is implemented") }
        
        var valuesToAdd = [BigInt]()
        
        for (index, leftDigit) in other.digits.reverse().enumerate() {
            
            var digits = [Int](count: index, repeatedValue: 0)
            var carryValue = 0
            for rightDigit in self.digits.reverse() {
                
                let value = rightDigit * leftDigit + carryValue
                let digit = value % base
                carryValue = value / base
                digits.insert(digit, atIndex: 0)
                
            }
            digits.insert(carryValue, atIndex: 0)
            let trimmedDigits = trimExcessZeros(digits)
            valuesToAdd.append(BigInt(digits: trimmedDigits, base: self.base))
        }
        
        var sum = BigInt(integer: 0)
        for value in valuesToAdd {
            sum = sum.add(value)
        }
        
        return sum
        
    }
    
}
