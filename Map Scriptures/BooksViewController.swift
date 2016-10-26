//
//  BooksViewController.swift
//  Map Scriptures
//
//  Created by Shawn Crawley on 10/25/16.
//  Copyright © 2016 Shawn Crawley. All rights reserved.
//

import UIKit

class BooksViewController : UITableViewController {
    
    private struct Storyboard {
        static let showScriptureIdentifier = "Show Scripture"
    }
    
    //MARK: - Properties
    
    var books: [Book]!
    
    //MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showScriptureIdentifier {
            if let destVC = segue.destination as? ScriptureViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    destVC.book = books[indexPath.row]
                    destVC.chapter = 2
                    destVC.title = "\(books[indexPath.row].fullName) 2"
                }
            }
        }
    }
    
    //MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)
        
        cell.textLabel?.text = books[indexPath.row].fullName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    //MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Storyboard.showScriptureIdentifier, sender: self)
    }
}
