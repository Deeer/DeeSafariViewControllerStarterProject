//
//  ViewController.swift
//  GettingStartedWithSafariViewController
//
//  Created by Jordan Morgan on 6/25/15.
//  Copyright © 2015 Jordan Morgan. All rights reserved.
//  总结： 三种不同的safari打开方式
//  1.通过url跳转到自带safari
//  2.通过UIWebView控件进行跳转
//  3.通过SFSafariViewController，直接弹出一个控制器
//  2.3两个点方式是看起来似乎是差不多的。但是最后一个方法是iOS9新添加的方式。给我们提供给了更多的
//  功能

import UIKit
import SafariServices

class ViewController: UIViewController,SFSafariViewControllerDelegate
{
    private var urlString:String = "https://google.com"

    //MARK: Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Web Content Presenting
    @IBAction func openInSafari(sender: AnyObject)
    {
        //TODO: Open in native safari
        let url = NSURL(string: self.urlString)!
        UIApplication.sharedApplication().openURL(url)
    }
    
    @IBAction func openWithSafariVC(sender: AnyObject)
    {
        //TODO: Open in safari view controller
//        let svc = SFSafariViewController(URL: NSURL(string: self.urlString)!)
        let svc = SFSafariViewController(URL: NSURL(string: self.urlString)!, entersReaderIfAvailable:true)
//        svc.delegate = self
        self.presentViewController(svc, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        //TODO: open in webview
        
        if let navVc = segue.destinationViewController as? UINavigationController
        {
            let cwVC = navVc.topViewController as! CustomWebViewController
            cwVC.urlString = self.urlString
        }
    }

    //代理方法不用调用也能实现dismiss效果
//    func safariViewControllerDidFinish(controller: SFSafariViewController)
//    {
//        controller.dismissViewControllerAnimated(false, completion: nil)
//    }
}

