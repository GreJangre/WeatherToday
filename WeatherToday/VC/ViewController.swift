//
//  ViewController.swift
//  WeatherToday
//
//  Created by 임성주 on 11/04/2019.
//  Copyright © 2019 jangre. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var countryTableView: UITableView!
    
    let countryCellIdentifier: String = "countryCell"
    
    var countries: [Countries] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CountryTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.countryCellIdentifier, for: indexPath) as! CountryTableViewCell
        let country: Countries = self.countries[indexPath.row]
        
        cell.countryLabel?.text = country.koreanName
        cell.countryImageView?.image = UIImage(named: "flag_" + country.assetName)
        cell.assetName = country.assetName
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
            return
        }
        
        do {
            self.countries = try jsonDecoder.decode([Countries].self, from: dataAsset.data)
        } catch {
            print("error: ", error.localizedDescription)
        }
        self.countryTableView.reloadData()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let nextViewController: CityViewController = segue.destination as? CityViewController else {
            return
        }
        guard let cell: CountryTableViewCell = sender as? CountryTableViewCell else {
            return
        }
        
        nextViewController.countryName = cell.countryLabel.text ?? "국가"
        nextViewController.assetName = cell.assetName
    }
}

