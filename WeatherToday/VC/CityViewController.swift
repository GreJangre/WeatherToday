//
//  CityViewController.swift
//  WeatherToday
//
//  Created by 임성주 on 11/04/2019.
//  Copyright © 2019 jangre. All rights reserved.
//

import UIKit

class CityViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var cityTableView: UITableView!
    
    let cityIdentifier: String = "cityCell"
    
    var countryName: String = ""
    var assetName: String?
    var cities: [Cities] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CityTableViewCell = tableView.dequeueReusableCell(withIdentifier: cityIdentifier, for: indexPath) as! CityTableViewCell
        let city: Cities = self.cities[indexPath.row]
        
        cell.cityLabel.text = city.cityName
        cell.tempLabel.text = city.celsiusToString
        cell.rainLabel.text = city.rainfallProbabilityToString
        cell.weatherImageView.image = UIImage(named: String(city.stateToEnglish))
        cell.weatherToSet = city.stateToKorean
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: assetName ?? "") else {
            return
        }

        do {
            self.cities = try jsonDecoder.decode([Cities].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = countryName
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let nextViewController: DetailViewController = segue.destination as? DetailViewController else {
            return
        }
        
        guard let cell: CityTableViewCell = sender as? CityTableViewCell else {
            return
        }
        
        nextViewController.titleToSet = cell.cityLabel.text
        nextViewController.weatherImage = cell.weatherImageView
        nextViewController.weatherToSet = cell.weatherToSet
        nextViewController.rainToSet = cell.rainLabel.text
        nextViewController.tempToSet = cell.tempLabel.text
    }
}
