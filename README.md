# StackedNotifications Demo
Simple demo app that shows how to integrate [StackedNotifications ](https://github.com/hakkabon/StackedNotifications) into your application.

## Import Statement
First, add an import statement to *StackedNotifications* like so:

```swift
import UIKit
import StackedNotifications
```

## Position and animation style
You probably want to customize your notifications depending on the device type being used:

```swift
struct iPadCustomOptions : NotificationOptions {
    var exitType: StackedNotification.ExitType { return StackedNotification.ExitType.slide }
    var position: StackedNotification.Position { return StackedNotification.Position.topRight }
}

struct iPhoneCustomOptions : NotificationOptions {
    var exitType: StackedNotification.ExitType { return StackedNotification.ExitType.pop }
    var position: StackedNotification.Position { return StackedNotification.Position.top }
}

let customOptions: NotificationOptions = UIDevice.current.userInterfaceIdiom == . pad ? iPadCustomOptions() : iPhoneCustomOptions()
```

## Display the notification
Display your notification where it is appropriate by using the `StackedNotification` API with the neccessary parameters supplied to . 

```swift
StackedNotification(title: "ERROR".localized, message: error.localizedDescription, options: customOptions).show()
```

## License
MIT
