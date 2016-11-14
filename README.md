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
###**Twitter Implementation & header for collection view**

+ Twitter 
 I learned how to implement the twitter Api which isn’t like other apis. You have to implement the twitter kit which I implemented with fabric, a third party mobile development platform. Once you find the software to implement the timeline to your app it was an interesting experience to put it together so that it shows up. I struggled with figuring out that I needed to use a tableViewController rather than a view controller. 
 
 ```swift
import UIKit
import TwitterKit

class TwitterViewController: TWTRTimelineViewController {
    
}
```
    

 + Collection View Header 
 I also worked with collection view headers which aren’t as complicated but a useful skill to learn. We ended up not implementing the headers in the app after seeing how it looks. 
 
 + Communication 
 Communication is also incredibly important when it comes to getting the product made at the highest quality. 



##Liam

What I learned about API Documentation Reading: 

I find it to be very difficult to navigate through the API documentation on most APIs. Many of them seem to be hobbled together in a manner that makes simple GET commands like we have been learning very difficult to use. For example, in the Reddit API, which I could not figure out completely, many of the coding examples and parameter breakdown was based on the more complex and thurough API calls we have yet to learn. The way that I managed to figure out how to read that information was to research more into how URLs are written. 

https://www.reddit.com/dev/api/

If you go into the documentation you will see that it just breaks down the last points of the endpoint. In this particular documentation it doesn't tell you the complete endpoint, you have to construct it using URL syntax. In this case you take the origin URL (https://www.reddit.com) and add in the type of data you want, this is done by adding /api/info.json to the end of the url. From there you will find that one needs to add parameters that aren't articulated completely in the documentation. Through throwing together the urls and inputting them into my browser, I found that they are almost all individualized. 

When compared to the New York Times API documentation, which clearly provides the parameters and will even make an example to call to show the information you should be getting from that call, I realised that I have much to learn regarding URL construction and API calls. In the case of this project I ended up using the Article Search API. At first the endpoint was unclear, all that the first page provided was the end of the URL. Upon clicking try it out I looked at the example code they provided and constructed the API endpoint based on reading the complex call they provided.

```javascript
var url = "https://api.nytimes.com/svc/search/v2/articlesearch.json";
    $.ajax({
        url: url,
        method: 'GET',
    }).done(function(result) {
        console.log(result);
    }).fail(function(err) {
        throw err;
});
```

The base endpoint is the string that is getting modified :

https://api.nytimes.com/svc/search/v2/articlesearch.json

At this point I went back to the original page and clicked around to get a feel for how the URL was constructed. I learned that to construct the URL you have to add a ? to designate that the following parts of the URL will be that parameters to be filled. For example to input the API key which is needed to access the information on this API, it looks like this: 

https://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=\(api key sent by NYTimes)

To find what the additional parameters are one has to look at the documentation and match the keys and add them onto the call by chaining them with an ampersand like so:

https://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=\(api key sent by NYTimes)&q=\(search)

Ultimately what I learned about reading documentation is that it will never tell the whole story. Much like learning the syntax for Swift in the first couple weeks of our class, ultimately playing around and breaking the urls is the most effective way to understand exactly how they work. 
