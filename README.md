#Project: Congress Fan Club

An app listing the members of the 115th United States Congress. 
Selecting a member of congress will, additionally, provide access to their Twitter timelines and relevant articles in the New York Times.


##Hari

###**The Argument For Always Using Custom Error-Handling In Your Project Model**

It's often useful to find out where exactly you're hitting errors in your code; especially when using optionals, which can represent an absence of a value but not necessarily the location of your nil value. 
+ Common scenario: Parsing through an API with if/let and guard statements.

> Swift provides first-class support for throwing, catching, propagating, and manipulating recoverable errors at runtime:
[The Swift Programming Language (Swift 3.0.1): Error Handling](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ErrorHandling.html)


Conforming to the Error protocol with a a unique custom type can allow for resilient error-handling. It's incredibly simple creating a custom error for each individual value you may be attempting to extract from an API. In the example below, each individual case represents an error I'm attempting to **throw** if an issue arises.

```swift
enum ParsingErrors: Error {
    case partyError, personError, firstnameError, genderError, idError, lastnameError, nameError, stateError, roleTypeError, twitterIDError
}
```


It might seem excessive having a myriad of custom errors but "failing gracefully" can help cut the time you take fixing bugs, dramatically. 
+ Unit assessments
+ Interviews
+ Hack-a-thons

```swift
do {
    try expression
    statements
} catch ParsingErrors.x {
    statements
} catch {
    statements
}
```








##Kadell

##Liam

