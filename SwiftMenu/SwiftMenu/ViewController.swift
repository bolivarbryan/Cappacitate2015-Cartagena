//
//  ViewController.swift
//  SwiftMenu
//
//  Created by Bryan A Bolivar M on 5/9/15.
//  Copyright (c) 2015 Bolivar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var arrowOption: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

}

