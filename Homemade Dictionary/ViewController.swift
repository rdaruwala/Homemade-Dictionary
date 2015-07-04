//
//  ViewController.swift
//  Homemade Dictionary
//
//  Created by Rohan Daruwala on 7/2/15.
//  Copyright © 2015 Rohan Daruwala. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lookupTextField: UITextField!
    @IBOutlet weak var lookupSubmitButton: UIButton!
    @IBOutlet weak var newDefinitionSubmitButton: UIButton!
    
    
    var Dictionary = [NSManagedObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage.png")!)
        
        lookupSubmitButton.backgroundColor = UIColor.clearColor()
        lookupSubmitButton.layer.cornerRadius = 10
        lookupSubmitButton.layer.borderWidth = 3
        lookupSubmitButton.layer.borderColor = UIColor.redColor().CGColor
        
        newDefinitionSubmitButton.backgroundColor = UIColor.clearColor()
        newDefinitionSubmitButton.layer.cornerRadius = 10
        newDefinitionSubmitButton.layer.borderWidth = 3
        newDefinitionSubmitButton.layer.borderColor = UIColor.redColor().CGColor
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillShowNotification, object: nil);
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func lookupSubmitAction(sender: AnyObject) {
        self.view.endEditing(true)
        if(lookupTextField.text != nil && lookupTextField.text != ""){
        /*    let definitionArray = Dictionary[lookupTextField.text!]
            if(definitionArray != nil){
                self.performSegueWithIdentifier("define", sender: self)
            }
            else{
                let alert = UIAlertController(title: "Invalid Word", message: "The word you entered is not in the dictionary. Please enter a definition for this word first.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }*/
        }
        
    }
    
    @IBAction func definitionSubmitAction(sender: AnyObject) {
        self.view.endEditing(true)
        self.performSegueWithIdentifier("input", sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "define"){
            let next = segue.destinationViewController as! viewDefinitionViewController
            next.wordRecieved = lookupTextField.text
        }
    }
    
    /**
    Moves the screen when keyboard is opened and closed
    **/
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= 125
    }
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 125
    }
    
    
}

