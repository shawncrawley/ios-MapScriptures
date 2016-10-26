//
//  VolumesViewController.swift
//  Map Scriptures
//
//  Created by Shawn Crawley on 10/25/16.
//  Copyright © 2016 Shawn Crawley. All rights reserved.
//

import UIKit

class VolumesViewController : UITableViewController {
    
    private struct Storyboard {
        static let volumeCellIdentifier = "VolumeCell"
        static let showBooksSegueIdentifier = "Show Books"
    }
    
    var volumes = GeoDatabase.sharedGeoDatabase.volumes()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showBooksSegueIdentifier {
            if let destVC = segue.destination as? BooksViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    destVC.books = GeoDatabase.sharedGeoDatabase.booksForParentId(indexPath.row + 1)
                    destVC.title = volumes[indexPath.row]
                }
            }
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.volumeCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = volumes[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return volumes.count
    }
}
