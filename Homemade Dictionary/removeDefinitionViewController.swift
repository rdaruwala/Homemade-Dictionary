//
//  removeDefinitionViewController.swift
//  Homemade Dictionary
//
//  Created by Rohan Daruwala on 7/6/15.
//  Copyright © 2015 Rohan Daruwala. All rights reserved.
//

import UIKit

class removeDefinitionViewController: UIViewController {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    var Dictionary:[String:[String]]!
    
    @IBOutlet weak var wordToRemoveBox: UITextField!
    @IBOutlet weak var definitionToRemoveBox: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    /**
    Runs when the view loads. Sets the background image and creates a border around the submit button
    **/
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage.png")!)
        self.title = "Remove a Definition"
        submitButton.backgroundColor = UIColor.clearColor()
        submitButton.layer.cornerRadius = 10
        submitButton.layer.borderWidth = 3
        submitButton.layer.borderColor = UIColor.redColor().CGColor

    }
    
    
    /**
    Checks if the image is in the dictionary. If it is, the function checks if the index is a valid spot. If it is, the definition for the corresponding slot is removed.
    **/
    @IBAction func submitAction(sender: AnyObject) {
        if(wordToRemoveBox.text != nil && wordToRemoveBox.text != ""){
            if(definitionToRemoveBox.text != nil && definitionToRemoveBox.text != ""){
                wordToRemoveBox.text = wordToRemoveBox.text?.lowercaseString
                Dictionary = defaults.objectForKey("dictionary") as? [String:[String]]
                if(Dictionary == nil){
                    Dictionary = [:]
                }
                
                if var defArray = Dictionary[wordToRemoveBox.text!]{
                    if(Int(definitionToRemoveBox.text!)! <= defArray.count){
                        defArray.removeAtIndex(Int(definitionToRemoveBox.text!)!-1)
                        Dictionary[wordToRemoveBox.text!] = defArray
                        defaults.setObject(Dictionary, forKey: "dictionary")
                        defaults.synchronize()
                        let alert = UIAlertController(title: "Definition Removed", message: "The definition has been removed!", preferredStyle: UIAlertControllerStyle.Alert)
                        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default, handler: nil))
                        self.presentViewController(alert, animated: true, completion: nil)
                    }
                    else{
                        let alert = UIAlertController(title: "Invalid Number", message: "There are not this many definitions for this word", preferredStyle: UIAlertControllerStyle.Alert)
                        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default, handler: nil))
                        self.presentViewController(alert, animated: true, completion: nil)
                    }
                }
                else{
                    let alert = UIAlertController(title: "Invalid Word", message: "The word you entered is not in the dictionary", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
