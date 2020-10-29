//
//  PlanetsViewController.swift
//  NasaGram
//
//  Created by Selcuk on 19.10.2020.
//

import Foundation
import UIKit


class PlanetViewController: UIViewController{
 
    var tableView: UITableView!
    
    var planetItems:[InfoPlanet]=[InfoPlanet]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        planetData()
    
    }
     
    // MARK -- Load data from json file.
    
    func planetData()
    {
        guard let fileLocation=Bundle.main.url(forResource: "mydata", withExtension: "json")
        else{
            return
        }
        do{
            let data = try Data(contentsOf: fileLocation)
            let receivedData = try JSONDecoder().decode([InfoPlanet].self, from: data)
            
            self.planetItems = receivedData
            
        }catch{
            print("error")
        }
    }
}

// MARK Table View Delegate
extension PlanetViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
       
        let vc = storyboard?.instantiateViewController(withIdentifier: "NasaPlanetController") as? NasaPlanetController
        vc?.planetItems = self.planetItems[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
}

// MARK TableViewCell Data Source

extension PlanetViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planetItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlanetTableViewCell.identifier, for: indexPath) as! PlanetTableViewCell
        cell.planetLabel?.text = planetItems[indexPath.row].title
        cell.myImageView.image =  UIImage(named:planetItems[indexPath.row].image)
        //cell.myImageView?.image = UIImage(named:planetItems[indexPath.row].image)
    
        return cell
    }
    
}

