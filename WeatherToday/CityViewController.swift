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
    var de: [De] = []
    var fr: [Fr] = []
    var it: [It] = []
    var jp: [Jp] = []
    var kr: [Kr] = []
    var us: [Us] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CityTableViewCell = tableView.dequeueReusableCell(withIdentifier: cityIdentifier, for: indexPath) as! CityTableViewCell
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let jsonDecoder: JSONDecoder = JSONDecoder()
//        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
//            return
//        }
//
//        do {
//            self.countries = try jsonDecoder.decode([Countries].self, from: dataAsset.data)
//        } catch {
//            print(error.localizedDescription)
//        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
