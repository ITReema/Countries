//
//  ViewController.swift
//  Countries
//
//  Created by mac_os on 16/09/1440 AH.
//  Copyright © 1440 mac_os. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var countries = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = Bundle.main.url(forResource: "data", withExtension: "json")
        
        if let jsonUrl = url {
            let jsonDecoder = JSONDecoder()
            if let data = try? Data(contentsOf: jsonUrl) {
                if let jsonCountry = try? jsonDecoder.decode(Countries.self, from: data) {
                    countries = jsonCountry.countries
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "country", for: indexPath)
        let country = countries[indexPath.row]
        cell.textLabel?.text = country.name
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = countries[indexPath.row]
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedCountry = country
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    

}

