//
//  Divisors.swift
//  Divisors
//
//  Created by Reese McLean on 12/13/15.
//  Copyright © 2015 Reese McLean. All rights reserved.
//

import Foundation

public func listDivisors(number: Int) -> [Int] {
    
    let limit = floor(sqrt(Double(number)))
    
    var divisors = [Int]()
    
    for testDivisor in 1...Int(limit) {
        
        if number % testDivisor == 0 {
            divisors.append(testDivisor)
            if testDivisor * testDivisor != number {
                divisors.append(number / testDivisor)
            }
        }
        
    }
    
    return divisors.sort(<)
    
}

//lists proper divisors of n (numbers less than n which divide evenly into n).

public func listProperDivisors(number: Int) -> [Int] {
    
    var divisorList = listDivisors(number)
    divisorList.removeLast()
    return divisorList
    
}