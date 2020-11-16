//
//  SeassonsViewController.swift
//  showTime
//
//  Created by Grazi Berti on 13/11/20.
//

import UIKit
import Alamofire

class SeassonsViewController: UIViewController {
    
    var receiveShow: Show?
    var arraySeassons = [Seasons] ()
    
    @IBOutlet weak var tableViewSeassonsNumber: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSeassonsNumber.delegate = self
        tableViewSeassonsNumber.dataSource = self
        
        loadDataAlamofire()
    }
    func reloadTable(newArray: [Seasons]){
        self.arraySeassons = newArray
        self.tableViewSeassonsNumber.reloadData()
        //print (self.arrayShow.count)
    }

    func loadDataAlamofire(){
        if let idShow = self.receiveShow {
            
            AF.request("http://api.tvmaze.com/shows/\(idShow.id!)/seasons").responseJSON { response in
                if let arrayDictionary = response.value as? [[String: Any]]{

                    var newArray = [Seasons]()

                    for item in arrayDictionary {
                        let show = Seasons(fromDictionary: item)
                        newArray.append(show)

                    }
                    self.reloadTable(newArray: newArray)
                }
            }
        }
    }
        
}
extension SeassonsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let episodes = UIStoryboard(name: "EpisodesViewController", bundle: nil).instantiateInitialViewController() as? EpisodesViewController {
            
            episodes.receiveSeassons = arraySeassons[indexPath.row]
            navigationController?.pushViewController(episodes, animated: true)
        }
        
    }
}
extension SeassonsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraySeassons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SeassonsTableViewCell", for: indexPath) as! SeassonsTableViewCell
        cell.setup(seassonShow: arraySeassons[indexPath.row])
        
        return cell
    }
    
    
}
