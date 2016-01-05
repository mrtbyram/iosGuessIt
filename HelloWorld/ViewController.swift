//
//  ViewController.swift
//  HelloWorld
//
//  Created by Murat Bayram on 08/11/15.
//  Copyright © 2015 Murat Bayram. All rights reserved.
//

import UIKit

struct guess {
    var number = 0;
    var result = ""
}

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var myText: UITextField!
    
    var guessHistory = [guess]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent!) {
        self.view.endEditing(true)
    }
    
    @IBAction func btnClick(sender: UIButton){
        guessHistory.append(guess(number: 5, result: "test"))
        self.view.endEditing(true)
        print(guessHistory)
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return guessHistory.count
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell: UITableViewCell = UITableViewCell()
        cell.detailTextLabel?.text = "3"
        return cell
    }

}
