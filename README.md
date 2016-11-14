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
            let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
            
            ...
            
            for dict in objectsArray {
                
                guard let party = dict["party"] as? String else {
                    throw ParsingErrors.partyError
                }
                
                let twitterID = personDict["twitterid"] as? String
                
                let congressPerson: CongressionalData = CongressionalData(party: party, firstname: firstname, gender: gender, id: id, lastname: lastname, name: name, state: state, roleType: roleType, twitterID: twitterID ?? "")
                
                allCongressMembers.append(congressPerson)
            }
            return allCongressMembers
        }
        catch ParsingErrors.partyError {
            print("Could not find the party key.")
        catch {
            print("Unknown error encountered!")
        }

```

####Syntax Breakdown:
"do" is coupled with "try"
+ If an error is **thrown** by the code in the **do** clause, it's matched against it's respective **catch** clause.
+ After each custom catch clause, a general catch clause needs to be made (note this is similar to the behavior of enums.)
+ The catch clause matches any error and binds the error to a local constant named __error__ (not being used in the example above).


This approach isn't very useful for single error situations but can serve as a valuable tool when dealing with a large number of values.



##Kadell
### Twitter Implementation & header for collection view ###

+Twitter 
 I learned how to implement the twitter Api which isn’t like other apis. You have to implement the twitter kit which I implemented with fabric, a third party mobile development platform. Once you find the software to implement the timeline to your app it was an interesting experience to put it together so that it shows up. I struggled with figuring out that I needed to use a tableViewController rather than a view controller. Im proud that I was able to figure out and implement something that we’ve never been taught before. 
 
 + Collection View Header 
 I also worked with collection view headers which aren’t as complicated but a useful skill to learn. We ended up not implementing the headers in the app after seeing how it looks. 
 
 + Communication 
 Communication is also incredibly important when it comes to getting the product made at the highest quality. 


##Liam

