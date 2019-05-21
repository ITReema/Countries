//
//  ViewController.swift
//  Countries
//
//  Created by mac_os on 16/09/1440 AH.
//  Copyright © 1440 mac_os. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var countries = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "country", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].uppercased()
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    

}

