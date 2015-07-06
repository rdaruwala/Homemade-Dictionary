//
//  viewDefinitionViewController.swift
//  Homemade Dictionary
//
//  Created by Rohan Daruwala on 7/2/15.
//  Copyright © 2015 Rohan Daruwala. All rights reserved.
//

import UIKit
import CoreData

class viewDefinitionViewController: UIViewController {
    
    
    let defaults = NSUserDefaults.standardUserDefaults()
    var Dictionary:[String:[String]]!
    var wordRecieved:String!
    

    @IBOutlet weak var definitionDisplayBox: UITextView!
    @IBOutlet weak var showWordBox: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage.png")!)
        
        definitionDisplayBox.editable = false
        
        /*let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        let ent = NSEntityDescription.entityForName("Info", inManagedObjectContext: context)
        let dic = Info(entity: ent!, insertIntoManagedObjectContext: context)
        var Dictionary = dic.dictionary*/
        
        
        Dictionary = defaults.objectForKey("dictionary") as! [String:[String]]
        let definitionArray:[String]! = Dictionary[wordRecieved]
        showWordBox.text = wordRecieved!
        
        
        var toReturn = ""
        
        for(var i = 0; i < definitionArray.count; i++){
            if(i != definitionArray.count - 1){
                toReturn = toReturn + String(i+1) + ") " + definitionArray[i] + "\n\n"
            }
            else{
                toReturn = toReturn + String(i+1) + ") " + definitionArray[i]
            }
        }
        
        definitionDisplayBox.text = toReturn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
