//
//  SuperHeroDetailViewController.swift
//  SuperHero
//
//  Created by Kaung Htet Hein on 10/15/21.
//

import UIKit

class SuperHeroDetailViewController: UIViewController {
    
    var superHero: SuperHeros?
    
    @IBOutlet var superHeroImage: UIImageView!
    @IBOutlet var superHeroName: UILabel!
    @IBOutlet var superHeroDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        superHeroName.text = superHero?.name
        superHeroDescription.text = superHero?.description
        superHeroImage.image = UIImage(named: superHero!.image)
        
        title = superHero?.name
    }
}
