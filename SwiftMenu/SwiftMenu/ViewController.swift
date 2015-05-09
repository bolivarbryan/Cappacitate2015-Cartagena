//
//  ViewController.swift
//  SwiftMenu
//
//  Created by Bryan A Bolivar M on 5/9/15.
//  Copyright (c) 2015 Bolivar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var arrowOption: UIImageView!
    var resultsArray: NSArray!
    var refresh:UIRefreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var miPost: Post = Post()
        miPost.titulo = ""
         resultsArray = []
        self.tableView.reloadData()
        refresh.addTarget(self, action: "reloadInfo", forControlEvents: UIControlEvents.ValueChanged)
        reloadInfo()
        refresh.backgroundColor = UIColor.purpleColor()
        refresh.tintColor = UIColor.whiteColor()
        self.tableView.backgroundColor = UIColor(red: 100/255.0, green: 100/255.0, blue: 100/255.0, alpha: 1.0)
        self.tableView.addSubview(refresh)
    }
    
    func reloadInfo(){
        let urlPath: String = "http://www.kbapi.co/g/55XNXGda.json"
        var url: NSURL = NSURL(string: urlPath)!
        var request1: NSURLRequest = NSURLRequest(URL: url)
        let queue:NSOperationQueue = NSOperationQueue()
        NSURLConnection.sendAsynchronousRequest(request1, queue: queue, completionHandler:{ (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var err: NSError
            if (error == nil){
                var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                println("AsSynchronous\(jsonResult)")
                self.resultsArray = (jsonResult.objectForKey("data") as! NSDictionary).objectForKey("Post") as! NSArray
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                    self.refresh.endRefreshing()
                })
                
            }else{
                UIAlertView(title: "Ok", message: "Ok", delegate: self, cancelButtonTitle: "ok").show()
            }
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func selectOption(sender: UIButton) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            var position: CGFloat = sender.frame.origin.x + CGFloat(-5 + sender.frame.size.width/2)
            self.arrowOption.frame = CGRectMake(position, sender.frame.origin.y + sender.frame.size.height - 10, self.arrowOption.frame.width, self.arrowOption.frame.height);
        })
    }
    
    //TABLEVIEW METHODS
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellID", forIndexPath: indexPath) as! CellTableViewCell
        println(self.resultsArray.objectAtIndex(indexPath.row))
        cell.name.text = self.resultsArray.objectAtIndex(indexPath.row).objectForKey("name") as! String
        
        cell.details.text = self.resultsArray.objectAtIndex(indexPath.row).objectForKey("details") as! String
    
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            //llamado asincrono
            var urlStr: NSString = self.resultsArray.objectAtIndex(indexPath.row).objectForKey("image") as! NSString
            let url = NSURL(string: urlStr as String)
            let data = NSData(contentsOfURL: url!)
            dispatch_async(dispatch_get_main_queue()) {
                //actualizar ui
                 cell.cellImage.image = UIImage(data: data!)
            }
        }
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 272
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resultsArray.count
    }

}

