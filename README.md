# EPICStringCleanups

EPICStringCleanups is a category extension on String, written in swift, that provides convenience methods cleaning up strings, presumably after user inputs. 

Utilities
---------
The String+Cleanup contains 4 main cleanup functions (with mutable and immutable variants) and one utility comparison function:

* trimmedString() -> String 
* trim() //mutable version

These functions can be used as shortcuts for trimming all whitespace and newline characters from the beginning and end of a string.

* normalizedString() -> String 
* normalize() //mutable version

These functions can be used to normalize a string, the resulting string will contain its lowercase representation using the base representation of all its characters, removing all diacritic representations from itself, which can be useful when the need to store diacritic sentive information is required. The resulting strings will also be trimmed.

* cleanString() -> String 
* cleanup() //mutable version

These utility methods can be used for removing double whitespaces and double returns, presumably after bad user input. The resulting string will also be trimmed. Can be useful when you need to store user input (i.e: username or address) information and avoiding extraneous characters.

* stringContainingOnlyCharactersInSet(characterSet: NSCharacterSet) -> String
* cleanupToContainOnlyCharactersInSet(characterSet: NSCharacterSet)

These functions clean a string by removing all characters not passed in by the input character set. Useful in situations when you want to enforce or extract specific characters in a string. 

* containsOnlyCharactersInSet(characterSet: NSCharacterSet) -> Bool

You can use this validator function to check if a function contains only characters from a certain set. The check is diacritic and case insensitive. Useful when you need to validate user input after a user has returned from edit mode.

#### Usage:
```swift
//trimming a string
var string = " hello world\n   "
let trimmed = string1.trimmedString
print(trimmed) //prints "hello world"
string.trim() //string is now "hello world" 

//normalize string
var string = "  Ècho\n\n  "
let normalized = string.normalizedString
print(normalized) //prints "echo"
string.normalize() //string is now "echo"

//clean string
var string = "\n\n This   is   a     string with  lots of    double spaces.    \n\n   And a newline.\n  Or two.    \n"
let cleaned = string.cleanString
print(cleaned) //prints "This is a string with lots of double spaces.\nAnd a newline.\nOr two."
string.cleanup() //string is now "This is a string with lots of double spaces.\nAnd a newline.\nOr two."

//constraining strings
var string = "This Contains Letters and Numbers 1234567890."
let constrained = string.stringContainingOnlyCharactersInSet(NSCharacterSet.decimalDigitCharacterSet())
print(constrained) //prints "1234567890"

string.cleanupToContainOnlyCharactersInSet(NSCharacterSet.uppercaseLetterCharacterSet()) //string is now TCLN

//validation
let string = "This Contains Only Letters."
string.containsOnlyCharactersInSet(NSCharacterSet.decimalDigitCharacterSet()) //returns false
```

This class serves as an extension to the tutorial of the blog article: ["TODO"](TODO).
A lot of effort is put towards making these tutorials and usage is free for all based on the attached license details, if you find this code useful, please consider [making a donation](http://epic-apps.uk/donations/). :)

Copyright (c) EPIC 
[www.epic-apps.uk](www.epic-apps.uk)



