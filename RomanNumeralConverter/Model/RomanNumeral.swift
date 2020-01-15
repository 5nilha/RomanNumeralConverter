//
//  RomanNumeral.swift
//  RomanNumeralConverter
//
//  Created by Fabio Quintanilha on 1/14/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

struct RomanNumeral {
    
    private let romanNums: [String : Int] = ["I" : 1,
                                             "V" : 5,
                                             "X" : 10,
                                             "L" : 50,
                                             "C" : 100,
                                             "D" : 500,
                                             "M" : 1000]
    
    private var romanNumber: String!
    
    init(romanNumber: String) {
        self.romanNumber = romanNumber
    }
    
    func getDecimalValue() -> Int? {
        let romanLetters: [String] = self.romanNumber.compactMap { (char) -> String in
            return "\(char)"
        }
        
        var value =  romanNums[romanLetters[0]]!
        for index in 1..<romanLetters.count {
            guard let letterValue = romanNums[romanLetters[index]] else { return -1}
            guard let previousLetterValue = romanNums[romanLetters[index - 1]] else { return -1}
           
            if letterValue > previousLetterValue {
                value += letterValue - previousLetterValue
                value -= previousLetterValue
            } else {
                value += letterValue
            }
        }
        
        return value != -1 ? value : nil
    }
    
   
}
