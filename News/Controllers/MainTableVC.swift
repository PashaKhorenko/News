//
//  MainTableVC.swift
//  News
//
//  Created by Pasha Khorenko on 09.02.2022.
//

import UIKit

class MainTableVC: UITableViewController {

    
    @IBAction func refreshControlAction(_ sender: UIRefreshControl) {
        
        loadNews {
            DispatchQueue.main.async {
                self.refreshControl?.endRefreshing()  //обновление представления с помощью свайпа
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadNews {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let article = articles[indexPath.row]
        
        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = article.author

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToOneNews", sender: self)
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToOneNews" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                (segue.destination as? DetailVC)?.article = articles[indexPath.row]
                tableView.deselectRow(at: indexPath, animated: true)
            }
            
        }
        
    }
    
}
