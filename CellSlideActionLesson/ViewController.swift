//
//  ViewController.swift
//  CellSlideActionLesson
//
//  Created by UrataHiroki on 2021/08/17.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var cellContentsArray = ["1","2","3","4","5","6","7","8","9","10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }


}


extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cellContentsArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = cellContentsArray[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
    }
    
    //左にスライドでhyouzi
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "削除") { _,_,_  in
                
            self.cellContentsArray.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath as IndexPath], with: .automatic)
            self.tableView.reloadData()
            
        }
        
        let cellPlus = UIContextualAction(style: .normal, title: "") { _, _, _ in
            
            self.cellContentsArray.insert(String(Int(self.cellContentsArray[indexPath.row])! + 1), at: indexPath.row + 1)
            self.tableView.reloadData()
            
        }
        cellPlus.image = UIImage(systemName: "plus.bubble")
        cellPlus.backgroundColor = .systemGreen
        
        return UISwipeActionsConfiguration(actions: [deleteAction,cellPlus])
    }
    
    
}
