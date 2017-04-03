//
//  ViewController.swift
//  HelloWorld
//
//  Created by Murat Bayram on 08/11/15.
//  Copyright © 2015 Murat Bayram. All rights reserved.
//

import UIKit
import Darwin

struct guess {
    var number = 0;
    var result = ""
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var gloText: UITextField!
    @IBOutlet var myText: UITextField!
    @IBOutlet var countText: UITextField!
    @IBOutlet weak var myTableView: UITableView!
    var globalIndex = 50
    var globalSum = 0
    
    var guessHistory = [guess]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent!) {
        self.view.endEditing(true)
    }
    
    @IBAction func btnClick(_ sender: UIButton){
        var sum = 0
        globalIndex = 50
        globalSum = 0
        guessHistory.removeAll()
        
        var cc = Int(countText.text!)
        let quene  = DispatchQueue(label: "asd")
        
        quene.async {
            
            for i in 0...Int(cc!){
                sum = 0;
                for j in 0...100 {
                    var randa = Int(arc4random_uniform(101))
                    sum = sum + randa
                }
                
                var avg = Int (sum/100)

                self.globalSum = self.globalSum + avg
                self.globalIndex = self.globalIndex + (avg - 50)
                
                self.guessHistory.append(guess(number: avg, result: "test"))
                
                
                DispatchQueue.main.async {
                    self.myText.text = String(self.globalSum/(i+1))
                    self.myTableView.reloadData()
                    self.gloText.text = String(self.globalIndex)
                }
                
                usleep(400000)
                
            }
            
            
            
        }
        
        
    }
    

    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return guessHistory.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell();
        cell.textLabel?.text = String(guessHistory[indexPath.row].number);
        return cell
    }

}
