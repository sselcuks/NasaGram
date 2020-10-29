//
//  ScopeViewController.swift
//  NasaGram
//
//  Created by Selcuk on 18.10.2020.
//

import Foundation
import UIKit
import Alamofire
import Kingfisher

 class ScopeViewController: UIViewController {
     let url = "https://apodapi.herokuapp.com/api/?count=8"
     var refreshControl = UIRefreshControl()

    @IBOutlet private weak var tableView: UITableView!
    
    var planets: [Planets] = []
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44
        self.tableView.register(UINib(nibName: "PhotosTableViewCell", bundle: nil), forCellReuseIdentifier: "PhotosTableViewCell")
        self.fetchData()
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(fetchData), for: .valueChanged)
        
        self.tableView.refreshControl = refreshControl
    }
    
    // MARK Fetch Data from API
    @objc func fetchData(){
        AF.request(self.url,method: .get).responseDecodable(of:[Planets].self, queue: DispatchQueue.main){
            [weak self]( response) in
            self?.planets = response.value ?? []
            self?.tableView.reloadData()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self?.refreshControl.endRefreshing()
                
            }
        }
    }
}

//MARK -- TableView Delegate
extension ScopeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.planet = self.planets[indexPath.row]
       
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

//MARK -- TableView Data Source

extension ScopeViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.planets.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as? PhotosTableViewCell  {
            
            cell.planet = self.planets[indexPath.row]
            
            return cell
        }
    
        return UITableViewCell()
    }
}
