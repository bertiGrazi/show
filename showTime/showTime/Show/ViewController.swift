//
//  ViewController.swift
//  showTime
//
//  Created by Grazi Berti on 13/11/20.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    var arrayShow = [Show] ()
    
    @IBOutlet weak var tableViewNameShow: UITableView!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            tableViewNameShow.delegate = self
            tableViewNameShow.dataSource = self

            loadDataAlamofire()

        }

        func reloadTable(newArray: [Show]){
            self.arrayShow = newArray
            self.tableViewNameShow.reloadData()
            //print (self.arrayShow.count)
        }

        func loadDataAlamofire(){
            AF.request("http://api.tvmaze.com/shows?page=1").responseJSON { response in
                if let arrayDictionary = response.value as? [[String: Any]]{

                    var newArray = [Show]()

                    for item in arrayDictionary {
                        let show = Show(fromDictionary: item)
                        newArray.append(show)

                    }
                    self.reloadTable(newArray: newArray)
                }
            }
        }
    }

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let seassons = UIStoryboard(name: "SeassonsViewController", bundle: nil).instantiateInitialViewController() as? SeassonsViewController {
            seassons.receiveShow = arrayShow[indexPath.row]
            navigationController?.pushViewController(seassons, animated: true)
            
        }
    }
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(self.arrayShow.count)
        return arrayShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowTableViewCell", for: indexPath) as! ShowTableViewCell
        cell.setup(showName: arrayShow[indexPath.row])
        
        return cell
    }
    
    
}
