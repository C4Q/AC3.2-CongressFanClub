#Project: Congress Fan Club

An app listing the members of the 115th United States Congress. 
Selecting a member of congress will, additionally, provide access to their Twitter timelines and relevant articles in the New York Times.

##Hari

###**The Argument For Always Using Custom Error-Handling In Your Project Model**

It's often useful to find out where exactly you're hitting errors in your code; especially when using optionals, which can represent an absence of a value but not necessarily the location of your error. 
+ Common scenario: Parsing through an API with if/let and guard statements.

Swift provides first-class support for throwing, catching, propagating, and manipulating recoverable errors at runtime.
[The Swift Programming Language (Swift 3.0.1): Error Handling](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ErrorHandling.html)

```swift
enum ParsingErrors: Error {
    case partyError, personError, firstnameError, genderError, idError, lastnameError, nameError, stateError, roleTypeError, twitterIDError
}
```











##Kadell

##Liam

