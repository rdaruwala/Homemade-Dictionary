//
//  inputDefinitionViewController.swift
//  Homemade Dictionary
//
//  Created by Rohan Daruwala on 7/2/15.
//  Copyright © 2015 Rohan Daruwala. All rights reserved.
//

import UIKit
import CoreData

class inputDefinitionViewController: UIViewController {
    
    
    @IBOutlet weak var wordTextField: UITextField!
    @IBOutlet weak var definitionTextField: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Dictionary = NSEntityDescription.insertNewObjectForEntityForName("Info", inManagedObjectContext: self.managedObjectContext) as! Info
        //var tempDictionary:[String:[String]] = Info.valueforKey(key: "dictionary") as? [String:[String]]
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage.png")!)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        
        submitButton.backgroundColor = UIColor.clearColor()
        submitButton.layer.cornerRadius = 10
        submitButton.layer.borderWidth = 3
        submitButton.layer.borderColor = UIColor.redColor().CGColor
        
        
        
    }
    
    @IBAction func submitButton(sender: AnyObject) {
        wordTextField.text = wordTextField.text?.lowercaseString
        if(definitionTextField.text != nil && definitionTextField.text != ""){
            if(wordTextField.text != nil && wordTextField.text != ""){
                let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                let context:NSManagedObjectContext = appDel.managedObjectContext
                let ent = NSEntityDescription.entityForName("Info", inManagedObjectContext: context)
                let dic = Info(entity: ent!, insertIntoManagedObjectContext: context)

                var Dictionary = dic.dictionary
                let definitionArray = Dictionary[definitionTextField.text!]
                if var defArray = definitionArray{
                    defArray.append((definitionTextField.text!))
                    Dictionary.updateValue(defArray, forKey: wordTextField.text!)
                    let alert = UIAlertController(title: "Definition added", message: "Definition has been added for word: " + wordTextField.text!, preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                }
                else{
                    Dictionary[wordTextField.text!] = [definitionTextField.text!]
                    let alert = UIAlertController(title: "Entry created", message: "\"" + wordTextField.text! + "\" has been added to the dictionary!", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                }
                dic.dictionary = Dictionary
                do{
                    try context.save()
                }
                catch{}
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= 125
    }
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 125
    }
    
    func saveDictionary(){
        
    }
    
    func loadDictionary(){
        
        
    }
    
    
}
