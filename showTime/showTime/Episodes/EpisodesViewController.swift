//
//  EpisodesViewController.swift
//  showTime
//
//  Created by Grazi Berti on 14/11/20.
//

import UIKit
import Alamofire

class EpisodesViewController: UIViewController {
    
    var receiveSeassons: Seasons?
    var arrayEpisodes = [Episodes] ()
    
    @IBOutlet weak var tableViewEpisodes: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewEpisodes.delegate = self
        tableViewEpisodes.dataSource = self
        
        loadDataAlamofire()
    }
    
    func reloadTable(newArray: [Episodes]){
        self.arrayEpisodes = newArray
        tableViewEpisodes.reloadData()
        //print (self.arrayShow.count)
    }
    
    func loadDataAlamofire(){
        if let idSeason = self.receiveSeassons {
            
            AF.request("http://api.tvmaze.com/seasons/\(idSeason.id!)/episodes").responseJSON { response in
                if let arrayDictionary = response.value as? [[String: Any]]{

                    var newArray = [Episodes]()

                    for item in arrayDictionary {
                        let show = Episodes(fromDictionary: item)
                        newArray.append(show)

                    }
                    self.reloadTable(newArray: newArray)
                }
            }
        }
    }

}

extension EpisodesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension EpisodesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodesTableViewCell", for: indexPath) as! EpisodesTableViewCell
        cell.setup(episodeShow: arrayEpisodes[indexPath.row])
        return cell
    }
    
    
}
