//
//  ViewController.swift
//  Downloaded Web Content
//
//  Created by Kevin Le on 2/22/17.
//  Copyright © 2017 Kevinvle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var webview: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        /*
        
       let url = URL(string: "https://www.simplifiedios.net")!
        
        // Create a url from a strong
        // Using let because this var will never change. Forced unwrapped because xcode thinks we may type our url incorrectly. Force unwrapping it tells us that we WILL type it in correctly.
        
        webview.loadRequest(URLRequest(url: url))
        
        // what if you got web content that is stored within app and want to display that in web view? See below
        
        webview.loadHTMLString("<h1> Hello there! </h1>", baseURL: nil) // baseURL is OPTIONAL so put as nil
        
        // We can also use apps to download actual code of a webpage, process it, and do whatever we want with it. It's a lot more powerful but more complicated
        
        */
        
        
        if let url = URL(string: "https://www.simplifiedios.net") { // Allows us to avoid any exclamation marks - forced unwrapping. Checking to see if this url can be created from this string. If it can, we create a request from that url (see below).
            
            let request = NSMutableURLRequest(url: url) // Allows us to create a request for a particular url.
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) { // Create a task - kind of like opening a browser grabbing content of url and returning it. URLSessionShared is a general session on the phone we use to access data. Cast request as URLRequest.
                
            data, response, error in // The three variables we use in our code to process the data and work out whether the task was successful. The "in" tells us to use these three var's "in" the following code:
                
                if error != nil { // If error is not nil, we have a problem
                    
                    print(error) // If there is an error then display error
                    
                } else {
                    
                    if let unwrappedData = data { // Check to see if we can get data var and if we can we convert to string(see below)
                        
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue) // Convert it. "encoding" returns raw value associated with this type of encoding so this NSString method knows what type of encoding we want. 
                        
                        print(dataString) // Printing that string
                        
                    }
                }
        
            }
            
            task.resume()
        }
        
        print("Hi there!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// NSMutableArray (and all other classes with Mutable in the name) can be modified. So, if you create a plain NSArray, you cannot change its contents later (without recreating it). But if you create an NSMutableArray, you can change it — you'll notice it has methods like -addObject: and -insertObject:atIndex: 
// Also, the "mutable" types are classes which can be changed after they've been initialized, like NSMutableString vs NSString.
