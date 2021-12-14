//
//  addIteamTableViewController.swift
//  Bucket List
//
//  Created by لمياء فالح الدوسري on 10/05/1443 AH.
//

import Foundation



protocol addIteamTableViewController :class{
    
    func saveItem(by controller:addTableViewController, with text: String,at indexPath:NSIndexPath?)
    
    func cancleButtonPreesed(by controller:addTableViewController)

}
