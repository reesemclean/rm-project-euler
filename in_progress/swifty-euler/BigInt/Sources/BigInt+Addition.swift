extension BigInt {
    
    public func add(other: BigInt) -> BigInt {
        
        guard self.base == other.base else { fatalError("Only adding BigInts with equal bases is implemented") }
        
        let leftMagnitude = self.digits.count
        let rightMagnitude = other.digits.count
        
        let biggestMagnitude = max(self.digits.count, other.digits.count)
        
        let numberOfZerosToPadToLeftValue = biggestMagnitude - leftMagnitude
        let numberOfZerosToPadToRightValue = biggestMagnitude - rightMagnitude
        
        let leftZeroArray = [Int](count: numberOfZerosToPadToLeftValue, repeatedValue: 0)
        let rightZeroArray = [Int](count: numberOfZerosToPadToRightValue, repeatedValue: 0)
        
        let leftDigits = leftZeroArray + self.digits
        let rightDigits = rightZeroArray + other.digits
        
        var digits: [Int] = []
        var carryValue = 0
        for index in (biggestMagnitude - 1).stride(through: 0, by: -1) {
            
            let leftDigit = leftDigits[index]
            let rightDigit = rightDigits[index]
            let value = leftDigit + rightDigit + carryValue
            let digit = value % base //18 % 10, digit = 8, carry
            
            if value >= base {
                carryValue = 1
            } else {
                carryValue = 0
            }
            
            digits.insert(digit, atIndex: 0)
            
        }
        
        digits.insert(carryValue, atIndex: 0)
        
        return BigInt(digits: trimExcessZeros(digits), base: self.base)
        
    }
    
}