//
//  String+Sorting.swift
//  EPICStringSorting
//
//  Created by Danny Bravo on 03/08/2015.
//  Copyright © 2015 EPIC. All rights reserved.
//

import Foundation

extension String {
    
    //MARK: - edited strings
    /// Trims all white space characters from the beginning and end of a string.
    var trimmedString : String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet());
    }
    
    /// Normalizes a string and returns its lowercase representation using the base representation of its characters. Result will trim and remove all diacritic representations from a string.
    var normalizedString : String {
        return self.trimmedString.stringByFoldingWithOptions([.CaseInsensitiveSearch, .DiacriticInsensitiveSearch], locale: NSLocale.currentLocale())
    }
    
    /// A utility method for removing double whitespaces and returns, presumably after user input. The resulting string will also be trimmed.
    var cleanString : String {
        var lines = self.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet()).filter({ !$0.isEmpty })
        for var index = 0; index < lines.count; index++ {
            let words = lines[index].componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).filter({ !$0.isEmpty })
            lines[index] = " ".join(words)
        }
        return "\n".join(lines)
    }
    
    /**
    Cleans a string by removing all characters not passed in by `characterSet`. Does not edit the original string.
    - parameter characterSet: An NSCharacterSet object containing the characters to keep in the return string
    - returns: A copy of itself containing only characters contained in `characterSet`
    */
    func stringContainingOnlyCharactersInSet(characterSet: NSCharacterSet) -> String {
        if containsOnlyCharactersInSet(characterSet) {
            return self
        }
        let components = self.componentsSeparatedByCharactersInSet(characterSet.invertedSet).filter({!$0.isEmpty})
        return "".join(components)
    }

    //MARK: - mutating strings edits
    /// Trims all white space characters from the beginning and end of a string.
    mutating func trim() {
        self = self.trimmedString
    }
    
    /// Normalizes a string and returns its lowercase representation using the base representation of its characters. Result will trim and remove all diacritic representations from a string. This function is mutating and can only be applied on variable strings
    mutating func normalize() {
        self = self.normalizedString
    }
    
    /// A utility method for removing double whitespaces and returns, presumably after user input. The resulting string will also be trimmed.
    mutating func cleanup() {
        self = self.cleanString
    }
    
    /**
    Use this mutating function to cull unwanted characters from a string. Cleans a string by removing all characters not passed in by `characterSet`. This method is mutating and will alter the original string.
    - parameter characterSet: An NSCharacterSet object containing the characters to keep in self
    */
    mutating func cleanupToContainOnlyCharactersInSet(characterSet: NSCharacterSet) {
        self = stringContainingOnlyCharactersInSet(characterSet)
    }
    
    //MARK: - validation  
    /**
    Validates a string to ensure that only characters from a given set are contained by it.
    - parameter characterSet: An NSCharacterSet object containing the characters to validate against.
    - returns: A boolean value returns true if all characters in the string are contained by `characterSet` and returns false otherwise.
    */
    func containsOnlyCharactersInSet(characterSet: NSCharacterSet) -> Bool {
        return self.rangeOfCharacterFromSet(characterSet.invertedSet, options: [NSStringCompareOptions.CaseInsensitiveSearch, NSStringCompareOptions.DiacriticInsensitiveSearch], range: self.startIndex..<self.endIndex) == nil
    }
    
}