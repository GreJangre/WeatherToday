//
//  DetailViewController.swift
//  WeatherToday
//
//  Created by 임성주 on 12/04/2019.
//  Copyright © 2019 jangre. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var rainLabel: UILabel!
    
    var titleToSet: String?
    var weatherImage: UIImageView?
    var weatherToSet: String?
    var tempToSet: String?
    var rainToSet: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = titleToSet
        self.imageView.image = self.weatherImage?.image
        self.weatherLabel.text = self.weatherToSet
        self.tempLabel.text = self.tempToSet
        self.rainLabel.text = self.rainToSet
    }
}
