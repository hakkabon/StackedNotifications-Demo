//
//  ViewController.swift
//  StackedNotifications-Demo
//
//  Created by Ulf Akerstedt-Inoue on 2020/10/01.
//

import UIKit
import StackedNotifications

struct TopLeftOptions : NotificationOptions {
    var exitType: StackedNotification.ExitType { return StackedNotification.ExitType.slide }
    var position: StackedNotification.Position { return StackedNotification.Position.topLeft }
}
struct TopOptions : NotificationOptions {
    var exitType: StackedNotification.ExitType { return StackedNotification.ExitType.pop }
    var position: StackedNotification.Position { return StackedNotification.Position.top }
}
struct TopRightOptions : NotificationOptions {
    var exitType: StackedNotification.ExitType { return StackedNotification.ExitType.slide }
    var position: StackedNotification.Position { return StackedNotification.Position.topRight }
}
struct BottomLeftOptions : NotificationOptions {
    var exitType: StackedNotification.ExitType { return StackedNotification.ExitType.slide }
    var position: StackedNotification.Position { return StackedNotification.Position.bottomLeft }
}
struct BottomOptions : NotificationOptions {
    var exitType: StackedNotification.ExitType { return StackedNotification.ExitType.dequeue }
    var position: StackedNotification.Position { return StackedNotification.Position.bottom }
}
struct BottomRightOptions : NotificationOptions {
    var exitType: StackedNotification.ExitType { return StackedNotification.ExitType.slide }
    var position: StackedNotification.Position { return StackedNotification.Position.bottomRight }
}

class ViewController: UIViewController {

    enum Position: Int {
        case topLeft=0, top, topRight
        case bottomLeft, bottom, bottomRight
    }

    @IBOutlet var buttonTop: UIButton!

    let customOptions = TopOptions()
    override var prefersStatusBarHidden: Bool { return false }
    override var preferredStatusBarStyle: UIStatusBarStyle { return .default }

    let message0 = ""
    let message1 = "Hello!"
    let message2 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tempor facilisis dolor at tincidunt. Cras in facilisis metus."
    let message3 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tempor facilisis dolor at tincidunt. Cras in facilisis metus. Pellentesque condimentum velit id nibh iaculis commodo."
    let message4 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tempor facilisis dolor at tincidunt. Cras in facilisis metus. Pellentesque condimentum velit id nibh iaculis commodo. Pellentesque volutpat, lectus ut vehicula imperdiet, nisl est sagittis nulla, a elementum ex purus eget enim. Donec suscipit pretium mi, non congue risus dapibus sed."

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Respond to button tap event.
    @IBAction func buttonTap(_ sender: UIButton) {
        var options: NotificationOptions?
        let position = Position(rawValue: sender.tag)!

        switch position {
        case .topLeft: options = TopLeftOptions()
        case .top: options = TopOptions()
        case .topRight: options = TopRightOptions()
        case .bottomLeft: options = BottomLeftOptions()
        case .bottom: options = BottomOptions()
        case .bottomRight: options = BottomRightOptions()
        }

        // No message.
        StackedNotification(title: "Silent", message: message0, options: options!).show()
        
        // One liner message.
        StackedNotification(title: "Hello", message: message1, options: options!).show()

        // Message that fits whithin stipulated (iphone, ipad) limits.
        StackedNotification(title: "Warning", message: message2, options: options!).show()
        
        // Long message that probably fits an ipad, but not an iphone.
        StackedNotification(title: "Error", message: message3, options: options!).show()
        
        // Too long message that doesn't fit whithin stipulated limits. Will be truncated.
        StackedNotification(title: "Alert", message: message4, options: options!).show()
    }
}
