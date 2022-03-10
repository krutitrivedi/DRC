//
//  WebLinkViewController.swift
//  DemoDRC


import UIKit
import WebKit

class WebLinkViewController: UIViewController {

    @IBOutlet var newsWeb: WKWebView!
    
    var newsURL:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //assign url for loading webview
        let url = URL(string: newsURL ?? "")
        newsWeb.load(URLRequest(url: url!))
        // Do any additional setup after loading the view.
    }
    

    

}
