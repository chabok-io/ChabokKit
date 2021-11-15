# Chabok iOS library
Blow some breath to your app with Chabok realtime messaging and receive push notifications cross any platform with zero code. Know your users's better, push them content based on their location or track their presence/location withoud headache.
Chabok help mobile application marketers to optimize their acquisition campaigns and increase user engagement & retention.

## Installation
For installation refer to [iOS docs](https://doc.chabok.io/ios/introducing.html) and platform specific parts (iOS).

## Release Note
You can find release note [here](https://doc.chabok.io/ios/release-note.html).

## Support
Please visit [Issues](https://github.com/chabok-io/chabok-client-ios/issues).


## Getting Started

These are the minimum required steps to integrate the Chabok SDK in your Android app. We assume that you are using Android Studio for your Android development. The minimum supported Android API level for the Chabok SDK integration is 16 (Jelly-bean).

### Installation

<br/>
<br/>
<br/>


### Initialization

Initialize Chabok SDK in your `AppDelegate` file:

> `Note:` Calling `Chabok.initialize()` is required for using Chabok SDK.

```swift
//Swift
import ChabokKit

 func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
    Chabok.initialize(clientId: "CLIENT_ID", clientSecret: "CLIENT_SECRET") {
        (success:Bool,message:String) in
        if (success) {
            NSLog("Successfully initialized.")
        } else {
            NSLog("%@", message)
        }
    }

    return true
}
```

```objectivec
//Objective-C

- (BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
	
    [Chabok initializeWithClientId:@"CLIENT_ID" clientSecret:@"CLIENT_SECRET" callback:^(BOOL success,NSString* message) {
        if (success) {
            NSLog(@"Successfully initialized.");
        } else {
            NSLog(@"%@", message);
        }
    }];

    return YES;
}

```

> `Note:` The application credentials (`CLIENT_ID` and `CLIENT_SECRET`) are available in your dashboard space under app info.

Place your `CLIENT_ID` and `CLIENT_SECRET` from your dashboard into the initialize method.


## Usage

&#32;
#### Set default tracker:

You can still understand the installation source in your campaign even if the stores do not support Referrer. The process is as follows:

- Create **new tracker** in your dashboard.
- Enter the **tracker ID** in the following method.

```swift
//Swift
Chabok.setDefaultTracker(id: "DEFAULT_TRACKER")
```

```objectivec
//Objective-C
[Chabok setDefaultTrackerWithId:@"DEFAULT_TRACKER"];
```

After getting the apk output, upload it to your desired store.

> `Note:` Default tracker should be called before `Chabok.initialize()`.

&#32;

<br/>

#### User

Chabok `USER_ID` is a unique ID that can be assigned to each user to identify him/her.
For example, a unique ID could be a generated UUID, a mobile number, etc.

Ideally, you should assign the unique ID to users when signing up, logging in, or on pages where their identity is known.


### Login

After initializing Chabok, use the `login` method to identify your users in the system to monitor all behaviors and attributes with user identity.
We recommend that you to use Chabok's login on otp pages.

When a user logs in, all the stored information is associated with the identified user.

To login user in the Chabok service use `login` method:

```swift
//Swift
Chabok.user().login(userId: "USER_ID")
```

```objectivec
//Objective-C
[Chabok.user loginWithUserId:@"USER_ID"];
```

`login` method with callback:

```swift
//Swift
Chabok.user().login(userId: "USER_ID") {
    (success:Bool,message:String) in
    if (success) {
        NSLog("User successfully logged in.")
    } else {
        NSLog("%@", message)
    }
}

```

```objectivec
//Objective-C
[Chabok.user loginWithUserId:@"USER_ID" callback:^(BOOL success,NSString* message) {
    if (success) {
        NSLog(@"User successfully logged in.");
    } else {
        NSLog(@"%@", message);
    }
}];
```

##### Example

When verifying user OTP codes, we should login to the Chabok platform to identify user by user ID

```swift
//Swift
Chabok.user().login(userId: "989100360500")
```

```objectivec
//Objective-C
[Chabok.user loginWithUserId:@"989100360500"];
```

<br/>
### Logout

By calling the following method, even if the user is logged out of his/her account, you can still have the user in your system with a guest ID and interact with the user as usual.

When the user logs out of your app, call the Chabok Logout method to avoid attaching future attributes, events, and other data to this user until the login method is called again.

`logout` method can be used to log out a user from Chabok:

```swift
//Swift
Chabok.user().logout()
```

```objectivec
//Objective-C
[Chabok.user logout];
```

`logout` method with callback:

```swift
//Swift
Chabok.user().logout() {
    (success:Bool,message:String) in
    if (success) {
        NSLog("User successfully logged out.")
    } else {
        NSLog("%@", message)
    }
}
```

```objectivec
//Objective-C
[Chabok.user logoutWithCallback:^(BOOL success,NSString* message) {
    if (success) {
        NSLog(@"User successfully logged out.");
    } else {
        NSLog(@"%@", message);
    }
}];
```


#### Check user is logged in:

To check a user is logged in Chabok you can use the following method.

```swift
//Swift
Chabok.user().isLoggedIn()
```

```objectivec
//Objective-C
Chabok.user.isLoggedIn
```

> `Tip:` In case you have implemented Chabok in your application, you can use the following method to check and login users who have already logged into your system but not into Chabok.


```swift
//Swift

if(!Chabok.user().isLoggedIn()) {
	Chabok.user().login(userId: "USER_ID")
}
```

```objectivec
//Objective-C

if(!Chabok.user.isLoggedIn) {
	[Chabok.user loginWithUserId:@"989100360500"];        
}

```

<br/>

### Analytics

#### Event

The events feature allows you to track any other user interactions that are vital to your business. Additionally, each custom event can have attributes such as amount, quantity, price, category, etc.
This data will allow you to personalize campaigns.

For tracking an `event` the process is as follows:
 
- Create a new event in your dashboard.
- Copy the ID and use it in `setEvent` method.
  
  <br/>

To set an analytics event use `setEvent` method:

>`Note:` Passing attributes to `event`'s method is optional.

```swift
//Swift
Chabok.analytics().setEvent(id: "ID", body: Dictionary<String,Any>)
```

```objectivec
//Objective-C
[Chabok.analytics setEventWithId:@"ID" body: NSDictionary<NSString *,id>];
```

##### Example

For example we want to track add to cart event.

- Create add-to-cart event in your dashboard.
- Create your event attributes.
- Then pass the attributes with the given ID to the `setEvent` method.

```swift
//Swift
let body: [String : Any] = [
	"product_id": "123456",
	"name": "T-shirt",
	"quantity": 10,
	"category": "Clothes",
	"price": 100.25,
	"currency": "USD",
	"chosen_colors": ["Black", "Blue", "White"],
	"discounted": true,
	"discount_percent": 15
]
        
Chabok.analytics().setEvent(id: "ID", body: body)
```

```objectivec
//Objective-C
NSDictionary *body = @{
	@"product_id": @"123456",
	@"name": @"T-shirt",
	@"quantity": @10,
	@"category": @"Clothes",
	@"price": @100.25,
	@"currency": @"USD",
	@"chosen_colors": @[@"Black", @"Blue", @"White"],
	@"discounted": @YES,
	@"discount_percent":@15        
};
        
[Chabok.analytics setEventWithId:@"ID" body:body];
```

Set `event` method with callback:

```swift
//Swift
Chabok.analytics().setEvent(id: "ID", body: Dictionary<String,Any>) {
    (success:Bool,message:String) in
    if (success) {
        NSLog("User's event has been successfully set.")
    } else {
        NSLog("%@", message)
    }
}
```

```objectivec
//Objective-C
[Chabok.analytics setEventWithId:@"ID" body: NSDictionary<NSString *,id> callback:^(BOOL success,NSString* message) {
    if (success) {
        NSLog(@"User's event has been successfully set.");
    } else {
        NSLog(@"%@", message);
    }
}];
```

#### Attributes

The user attributes you collect can give you a comprehensive picture of who your users are, where they're from, what they do, and a whole lot more, depending on your business. An attribute is something like favorites, user preferences, or etc. You can segment users based on their contextual relevance and personalize marketing campaigns sent through all channels of engagement with such granular user data.

To set user attributes in the Chabok service use `setAttribute` method:

```swift
//Swift
Chabok.user().setAttribute(attributes: Dictionary<String,Any>);
```

```objectivec
//Objective-C
[Chabok.user setAttributeWithAttributes: NSDictionary<NSString *,id>];
```

##### Example

For example we want to store attributes of a stock trader.

```swift
//Swift
let userAttribute: [String : Any] = [
	"trades_everyday": true,
	"favorite_Stocks": ["Tesla","Facebook"],
	"is_vip": true,
	"first_trade_date": "18-9-2020",
	"last_trade_date": "5-8-2021",
	"has_inviter": true,
	"inviter_id": "smooke9"
]
        
Chabok.user().setAttribute(attributes: userAttribute)
```

```objectivec
//Objective-C
NSDictionary *userAttribute = @{
	@"trades_everyday": @YES,
	@"favorite_Stocks": @[@"Tesla",@"Facebook"],
	@"is_vip": @YES,
	@"first_trade_date": @"18-9-2020",
	@"last_trade_date": @"5-8-2021",
	@"has_inviter": @YES,
	@"inviter_id": @"smooke9"       
};
    
[Chabok.user setAttributeWithAttributes:userAttribute];
```

Set user's attributes method with callback:

```swift
//Swift
Chabok.user().setAttribute(attributes: Dictionary<String,Any>) {
    (success:Bool,message:String) in
    if (success) {
        NSLog("User's attribute has been successfully set.")
    } else {
        NSLog("%@", message)
    }
}
```

```objectivec
//Objective-C
[Chabok.user setAttributeWithAttributes: NSDictionary<NSString *,id> callback:^(BOOL success,NSString* message) {
    if (success) {
        NSLog(@"User's attribute has been successfully set.");
    } else {
        NSLog(@"%@", message);
    }
}];
```


#### Profile
Use the `setProfile` method to enter user information such as first name, last name, gender, etc.

To set user's profile information in the Chabok service use `setProfile` method:

```swift
//Swift
let profile:Profile = Profile.Builder()
        .email("EMAIL") //e.g. dev.chabok@gmail.com
        .mobile("MOBILE") //e.g. 989100360500
        .name("NAME") //e.g. Hossein
        .family("FAMILY") //e.g. Shooshtari
        .birthDate("BIRTH_DATE") //e.g. 29-02-1372
        .gender(GENDER) //e.g. Gender.MALE
        .timeZone("TIME_ZONE") //e.g. +3:30
        .build()

Chabok.user().setProfile(profile: profile)
```

```objectivec
//Objective-C
ProfileBuilder *profile = [ProfileBuilder new];
    [profile email:@"EMAIL"]; //e.g. dev.chabok@gmail.com
    [profile mobile:@"MOBILE"]; //e.g. 989100360500
    [profile name:@"NAME"]; //e.g. Hossein
    [profile family:@"FAMILY"]; //e.g. Shooshtari
    [profile birthDate:@"BIRTH_DATE"]; //e.g. 29-02-1372
    [profile timeZone:@"TIME_ZONE"]; //e.g. +3:30
    [profile gender: GENDER]; //e.g. GenderMALE
    
[Chabok.user setProfileWithProfile: profile.build];
```
<br/>

Set user's `profile` information method with callback:

```swift
//Swift
Chabok.user().setProfile(profile: profile) {
    (success:Bool,message:String) in
    if (success) {
        NSLog("User's profile updated successfully.")
    } else {
        NSLog("%@", message)
    }
}
```

```objectivec
//Objective-C
[Chabok.user setProfileWithProfile: profile callback:^(BOOL success,NSString* message) {
    if (success) {
        NSLog(@"User's profile updated successfully.");
    } else {
        NSLog(@"%@", message);
    }
}];
```


#### Location
Use the `setLocation` method to enter user's location.

To set user's `location` use `setLocation` method:

```swift
//Swift
Chabok.user().setLocation(latitude: LATITUDE, longitude: LONGITUDE)

```

```objectivec
//Objective-C
[Chabok.user setLocationWithLatitude: LATITUDE longitude: LONGITUDE];
```

<br/>

Set user's `location` information method with callback:


```swift
//Swift
Chabok.user().setLocation(latitude: LATITUDE, longitude: LONGITUDE) {
    (success:Bool,message:String) in
    if (success) {
        NSLog("User's location updated successfully.")
    } else {
        NSLog("%@", message)
    }
}
```

```objectivec
//Objective-C
[Chabok.user setLocationWithLatitude: LATITUDE longitude: LONGITUDE callback:^(BOOL success,NSString* message) {
    if (success) {
        NSLog(@"User's location updated successfully.");
    } else {
        NSLog(@"%@", message);
    }
}];
```

### Push ID (campaign & uninstall tracking)

Push tokens are used for User engagement (Push Notification Campagin and User Journey) and client callbacks; they are also required for **uninstall** and **reinstall** tracking.

To set user `push id` in the Chabok service use `PushId` method:

```swift
//Swift
Chabok.user().setPushId(id: "PUSH_ID")

```

```objectivec
//Objective-C
[Chabok.user setPushIdWithId:@"PUSH_ID"];
```


Set user `PUSH_ID` method with callback:

```swift
//Swift
Chabok.user().setPushId(id: "PUSH_ID") {
    (success:Bool,message:String) in
    if (success) {
        NSLog("User's push id has been successfully set.")
    } else {
        NSLog("%@", message)
    }
}

```

```objectivec
//Objective-C
[Chabok.user setPushIdWithId:@"PUSH_ID" callback:^(BOOL success,NSString* message) {
    if (success) {
        NSLog(@"User's push id has been successfully set.");
    } else {
        NSLog(@"%@", message);
    }
}];
```

<br/>
<br/>


### Debugging features


&#32;
#### Enable/Disable Chabok SDK:
```swift
//Swift
Chabok.disableSdk(disableSdk: true)
```

```objectivec
//Objective-C
[Chabok disableSdkWithDisableSdk:YES];
```

&#32;
#### Set log level:
```swift
//Swift
Chabok.setLogLevel(logLevel: LogLevel.Verbose)
```

```objectivec
//Objective-C
[Chabok setLogLevelWithLogLevel:LogLevelVerbose];
```

&#32;
#### Lock SDK's logging:
```swift
//Swift
Chabok.lockLogging(lock: true)
```

```objectivec
//Objective-C
[Chabok lockLoggingWithLock:YES];
```
