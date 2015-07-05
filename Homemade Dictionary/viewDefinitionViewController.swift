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
    
    //var Dictionary = [String:[String]]()
    var wordRecieved:String!

    @IBOutlet weak var definitionDisplayBox: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage.png")!)
        
        definitionDisplayBox.editable = false
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        let ent = NSEntityDescription.entityForName("Info", inManagedObjectContext: context)
        let dic = Info(entity: ent!, insertIntoManagedObjectContext: context)
        var Dictionary = dic.dictionary
        
        let definitionArray:[String]! = Dictionary[wordRecieved]
        
        
        var toReturn = ""
        for value in definitionArray{
            toReturn = toReturn + value + "\n"
        }
        
        definitionDisplayBox.text = toReturn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
