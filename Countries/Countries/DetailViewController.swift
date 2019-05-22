//
//  DetailViewController.swift
//  Countries
//
//  Created by mac_os on 16/09/1440 AH.
//  Copyright © 1440 mac_os. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var capital: UILabel!
    @IBOutlet var size: UILabel!
    @IBOutlet var population: UILabel!
    @IBOutlet var currency: UILabel!
    
    var selectedCountry: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        guard let country = selectedCountry else {return}
        
        title = country.name

        imageView.image = UIImage(named: country.flag)
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 1
        capital.text = "Capital: \(country.capital)"
        population.text = "Population: \(country.population)"
        size.text = "Area: \(country.area) km2"
        currency.text = "Currency: \(country.currency)"
    
    }
    
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
    
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
}
