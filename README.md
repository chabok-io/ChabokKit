# Chabok iOS library
Blow some breath to your app with Chabok realtime messaging and receive push notifications cross any platform with zero code. Know your users's better, push them content based on their location or track their presence/location withoud headache.
Chabok help mobile application marketers to optimize their acquisition campaigns and increase user engagement & retention.

## Installation
For installation refer to [iOS docs](https://doc.chabok.io/ios/introducing.html) and platform specific parts (iOS).

## Release Note
You can find release note [here](https://doc.chabok.io/chabok-ios/release-note.html).

## Support
Please visit [Issues](https://github.com/chabok-io/chabok-ios/issues).


## Getting Started

These are the minimum required steps to integrate the Chabok SDK in your IOS app.

### Installation

Add the latest `ChabokSDK` version to your project's Podfile.

```
target 'YourProject' do
  use_frameworks!

  pod 'ChabokSDK', '~> 1.0.3'
  
end
```

Open your project's root folder in your terminal and run:

```
$ pod install --repo-update
```

### Setup

##### 1. Add Capabilities
This step enables your project to receive remote/push notifications.

Select the root project > your main app target > Signing & Capabilities.

To enable Push Notifications, click + Capability and add it.


![image](https://github.com/smooke/chabok-v2-docs/blob/main/images/ios/ios-doc-image-1.png)

Again, click on + Capability and add Background Modes. Check Remote notifications next.

![image](https://github.com/smooke/chabok-v2-docs/blob/main/images/ios/ios-doc-image-2.png)

##### 2. Add Notification Service Extension
By adding the ChabokNotificationServiceExtension to your iOS application, you can receive rich notifications with images, buttons, and badges. It's also required for Chabok's Confirmed Delivery analytics features.

In Xcode Select File > New > Target...

Select Notification Service Extension then Next.

![image](https://github.com/smooke/chabok-v2-docs/blob/main/images/ios/ios-doc-image-3.png)

Enter the product name as ChabokNotificationServiceExtension and press Finish.

![image](https://github.com/smooke/chabok-v2-docs/blob/main/images/ios/ios-doc-image-4.png)

Do not activate the scheme on the dialog that is shown after selecting "Finish".

Press Cancel on the Activate scheme prompt.

![image](https://github.com/smooke/chabok-v2-docs/blob/main/images/ios/ios-doc-image-5.png)

By canceling, you keep Xcode debugging your app instead of the extension you just created. If you activated by accident, you can switch back to debug your app target (middle-top next to the device selector).

Select the ChabokNotificationServiceExtension target and General settings.

Set Minimum Deployments to be the same value as your Main Application Target. This should be iOS 11 or higher.

![image](https://github.com/smooke/chabok-v2-docs/blob/main/images/ios/ios-doc-image-6.png)

Set the ChabokNotificationServiceExtension Target Minimum Deployments value to be the same as your Main Application Target.

##### 3. Add App Groups
App Groups allow your app and the ChabokNotificationServiceExtension to communicate when a notification is received, even if your app is not active. This is required for badges and Confirmed Deliveries.

Select your Main App Target > Signing & Capabilities > + Capability > App Groups.

![image](https://github.com/smooke/chabok-v2-docs/blob/main/images/ios/ios-doc-image-7.png)

Within App Groups, click the + button.

Set the App Groups container to be group.YOUR_BUNDLE_IDENTIFIER.Chabok where YOUR_BUNDLE_IDENTIFIER is the same as your Main Application "Bundle Identifier".


![image](https://github.com/smooke/chabok-v2-docs/blob/main/images/ios/ios-doc-image-8.png)

Press OK and repeat for the ChabokNotificationServiceExtension Target.

Select the ChabokNotificationServiceExtension Target > Signing & Capabilities > + Capability > App Groups.


![image](https://github.com/smooke/chabok-v2-docs/blob/main/images/ios/ios-doc-image-9.png)


Within App Groups, click the + button.

Set the App Groups container to be group.YOUR_BUNDLE_IDENTIFIER.Chabok where YOUR_BUNDLE_IDENTIFIER is the same as your Main Application "Bundle Identifier".

DO NOT INCLUDE ChabokNotificationServiceExtension.


![image](https://github.com/smooke/chabok-v2-docs/blob/main/images/ios/ios-doc-image-10.png)

Do not include ChabokNotificationServiceExtension

### Initialization

Initialize Chabok SDK in your `AppDelegate` file:

> `Note:` Calling `Chabok.initialize()` is required for using Chabok SDK.

```swift
//Swift
import ChabokSDK

 func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
 
  	Chabok.initialize(appId: "APP_ID", secret: "SECRET") {
          (success,message) in
           if(success) {
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
	
    [Chabok initializeWithAppId:@"APP_ID" secret:@"SECRET" callback:^(BOOL success,NSString* message) {
        if (success){} else {}
    }];

    return YES;
}

```

> `Note:` The application credentials (`APP_ID` and `SECRET`) are available in your dashboard space under app info.

Place your `APP_ID` and `SECRET` from your dashboard into the initialize method.

## Usage

#### User

Chabok `USERNAME` is a unique ID that can be assigned to each user to identify him/her.
For example, a unique ID could be a generated UUID, a mobile number, etc.

Ideally, you should assign the unique ID to users when signing up, logging in, or on pages where their identity is known.


### Login

After initializing Chabok, use the `login` method to identify your users in the system to monitor all behaviors and attributes with user identity.
We recommend that you to use Chabok's login on otp pages.

When a user logs in, all the stored information is associated with the identified user.

To login user in the Chabok service use `login` method:

```objective-c
//objective-c

[Chabok.user loginWithUsername:@"USERNAME"];
```
```Swift
//Swift

Chabok.user().login("USERNAME")
```

`login` method with callback:

```objective-c
//objective-c

 [Chabok.user loginWithUsername:@"USERNAME" callback:^(BOOL success,NSString* message) {
        if (success) {
            NSLog(@"Successfully initialized.");
        } else {
            NSLog(@"%@", message);
        }
    }];

```
```Swift
//Swift

Chabok.user().login("USERNAME", object : Callback {  
    override fun onResponse(success: Boolean, message: String?) {  
        if (success){  
            print("User has successfully logged in")  
        } else {  
            print("$message")  
        }  
    }  
})
```

##### Example

When verifying user OTP codes, we should login to the Chabok platform to identify user by user ID

```objective-c
//objective-c

Chabok.user().login("989100360500");
```
```Swift
//Swift

Chabok.user().login("989100360500");
```

<br/>
### Logout

By calling the following method, even if the user is logged out of his/her account, you can still have the user in your system with a guest ID and interact with the user as usual.

When the user logs out of your app, call the Chabok Logout method to avoid attaching future attributes, events, and other data to this user until the login method is called again.

`logout` method can be used to log out a user from Chabok:

```objective-c
//objective-c
[Chabok.user logout];
```
```Swift
//Swift

Chabok.user().logout()
```

`logout` method with callback:

```objective-c
//objective-c    
[Chabok.user logoutWithCallback:^(BOOL success,NSString* message) {
    if (success) {
        NSLog(@"Successfully Logged in.");
    } else {
        NSLog(@"%@", message);
    }
}];
```
```Swift
//Swift

Chabok.user().logout(object : Callback {  
    override fun onResponse(success: Boolean, message: String?) {  
	    if (success){  
            print("User has successfully logged out")  
        } else {  
            print("$message")  
        } 
    }  
})
```


#### Check user is logged in:

To check a user is logged in Chabok you can use the following method.

```objective-c
//objective-c

Chabok.user().isLoggedIn();
```
```Swift
//Swift

Chabok.user().isLoggedIn();
```

> `Tip:` In case you have implemented Chabok in your application, you can use the following method to check and login users who have already logged into your system but not into Chabok.


```objective-c
//objective-c

if (!Chabok.user().isLoggedIn()) {
   Chabok.user().login("USER_ID");
}
```
```Swift
//Swift

if (!Chabok.user().isLoggedIn()) {
   Chabok.user().login("USER_ID")
}
```

#### Tag

To set user tag in the Chabok service use `setUserTag` method:

```objective-c
//objective-c

[Chabok.user setTagWithTag:@"TAG"];
```

```Swift
//Swift

Chabok.user().setUserTag("TAG")
```

To set array of tags in the Chabok service use `setUserTags` method:

```objective-c
//objective-c

[Chabok.user setTagsWithTags: NSArray<NSString *> *tags];
```

```Swift
//Swift

Chabok.user().setUserTags(Array<String>)
```

##### Example

```objective-c
//objective-c

Chabok.user().setUserTag("VIP");
```
```Swift
//Swift

Chabok.user().setUserTag("VIP")
```

<br/>

Set user's tag method with callback:

```objective-c
//objective-c
    
[Chabok.user setTagWithTag:@"TAG" callback:^(BOOL success,NSString* message) {
    if (success) {
        NSLog(@"Successfully Done.");
    } else {
        NSLog(@"%@", message);
    }
}];
```
```Swift
//Swift

Chabok.user().setUserTag("TAG", object : Callback {  
    override fun onResponse(success: Boolean, message: String?) {  
          
    }  
})
```

To unset user tag in the Chabok service use `unsetUserTag` method:

```objective-c
//objective-c

[Chabok.user unsetUserTag:@"TAG"];
```

```Swift
//Swift

Chabok.user().unsetUserTag("TAG")
```

To unset array of tags in the Chabok service use `unsetUserTags` method:

```objective-c
//objective-c

[Chabok.user setTagsWithTags: NSArray<NSString *> *tags];
```

```Swift
//Swift

Chabok.user().unsetUserTags(Array<String>)
```

##### Example

```objective-c
//objective-c

[Chabok.user unsetUserTag:@"VIP"];
```
```Swift
//Swift

Chabok.user().unsetUserTag("VIP")
```

<br/>

Unset user's tag method with callback:

```objective-c
//objective-c

[Chabok.user unsetTagWithTag:@"TAG" callback:^(BOOL success,NSString* message) {
    if (success) {
        NSLog(@"Successfully Done.");
    } else {
        NSLog(@"%@", message);
    }
}];
```
```Swift
//Swift

Chabok.user().unsetUserTag("TAG", object : Callback {
    override fun onResponse(success: Boolean, message: String?) {

    }
})
```


#### Attributes

The user attributes you collect can give you a comprehensive picture of who your users are, where they're from, what they do, and a whole lot more, depending on your business. An attribute is something like favorites, user preferences, or etc. You can segment users based on their contextual relevance and personalize marketing campaigns sent through all channels of engagement with such granular user data.

To set user attributes in the Chabok service use `setUserAttribute` method:

```objective-c
//objective-c

[Chabok.user setAttributeWithKey:@"KEY" value:@"VALUE"];
```
```Swift
//Swift

Chabok.user().setUserAttribute("KEY","VALUE")
```

##### Example

```objective-c
//objective-c

[Chabok.user setAttributeWithKey:@"City" value:@"Karaj"];
```
```Swift
//Swift

Chabok.user().setUserAttribute("City","Karaj")
```

<br/>

Set user's attributes method with callback:

```objective-c
//objective-c

[Chabok.user setAttributeWithKey:@"KEY" value:@"VALUE" callback:^(BOOL success,NSString* message) {
        if (success) {
            NSLog(@"Successfully Done.");
        } else {
            NSLog(@"%@", message);
        }
    }];
```
```Swift
//Swift

Chabok.user().setUserAttribute("KEY","VALUE", object : Callback {  
    override fun onResponse(success: Boolean, message: String?) {  
          
    }  
})
```

To unset user attributes in the Chabok service use `unsetUserAttribute` method:

```objective-c
//objective-c

[Chabok.user unsetAttributeWithKey:@"KEY"];
```
```Swift
//Swift

Chabok.user().unsetUserAttribute("KEY")
```

##### Example

```objective-c
//objective-c

[Chabok.user unsetAttributeWithKey:@"City"];
```
```Swift
//Swift

Chabok.user().unsetUserAttribute("City")
```

<br/>

Unset user's attributes method with callback:

```objective-c
//objective-c

[Chabok.user unsetAttributeWithKey:@"KEY" callback:^(BOOL success,NSString* message) {
        if (success) {
            NSLog(@"Successfully Done.");
        } else {
            NSLog(@"%@", message);
        }
    }];
```
```Swift
//Swift

Chabok.user().unsetUserAttribute("KEY", object : Callback {
    override fun onResponse(success: Boolean, message: String?) {

    }
})
```

#### Profile
Use the `setProfile` method to enter user information such as first name, last name, gender, etc.

To set user's profile information in the Chabok service use `setProfile` method:

```objective-c
//objective-c

ProfileBuilder *profile = [ProfileBuilder new];
    [profile email:@"EMAIL"];
    [profile phoneNumber:@"FIRSTNAME"]; //e.g. 989100360500
    [profile firstName:@"FIRSTNAME"]; //e.g. Hossein
    [profile lastName:@"LASTNAME"]; //e.g. Shooshtari
    [profile birthDate:@"BIRTH_DATE"]; //e.g. (timestamp) 3131231232 
    [profile gender: GENDER]; //e.g. Gender.MALE
    
[[Chabok user]setProfileWithProfile: profile.build];
```
```Swift
//Swift

val profile: Profile = Profile.Builder()
    .email("EMAIL") //e.g. dev.chabok@gmail.com  
    .phoneNumber("PHONE_NUMBER") //e.g. 989100360500  
    .firstName("FIRSTNAME") //e.g. Hossein  
    .lastName("LASTNAME") //e.g. Shooshtari  
    .birthDate("BIRTH_DATE") //e.g. (timestamp) 3131231232  
    .gender(Gender.MALE) //e.g. Gender.MALE  
    .build()

Chabok.user().setProfile(profile)
```

<br/>

Set user's `profile` information method with callback:

```objective-c
//objective-c

[[Chabok user]setProfileWithProfile: profile.build callback:^(BOOL success,NSString* message) {
        if (success){} else {}
    }];
```
```Swift
//Swift

Chabok.user().setProfile(profile, object : Callback {
    override fun onResponse(success: Boolean, message: String?) {

    }
})
```

### Notification features


&#32;
#### Get passed data in notification payload.

```objective-c
//objective-c

[Chabok.message addNotificationHandlerWithPassData:^(NSDictionary* data) {
        NSLog(@"~~~~~ Chabok received data ~~~~~> %@", data);
    }];
```
```Swift
//Swift

Chabok.message().addNotificationHandler(object: NotificationHandler() {
    override fun notificationData(data: JSONObject) {
        super.notificationData(data)
    }
})
```

#### Send notification permission status:

```objective-c
Chabok.message().setNotificationPermissionStatus(false);
```

#### Send Chabok intents to SDK:

To get the push notification delivery report for Android 12 devices, call the following method:

> `Note:` Methode should be called in `onCreate` and `onNewIntent`.

```objective-c
Chabok.message().passIntent(intent);
```

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
