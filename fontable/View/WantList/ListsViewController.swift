//
//  ListsViewController.swift
//  fontable
//
//  Created by 홍태희 on 2022/03/17.
//

import UIKit
import CoreData

class ListsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tableViews: UITableView?
    
    @IBAction func addList(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let reqVC = storyBoard.instantiateViewController(withIdentifier: "request")
        reqVC.modalPresentationStyle = .overCurrentContext
        present(reqVC, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        DataManagers.shared.loadDatas()
        tableViews?.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViews?.delegate = self
        tableViews?.dataSource = self
    }
}

extension ListsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManagers.shared.want.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let food = DataManagers.shared.want[indexPath.row]
        let cell = tableViews?.dequeueReusableCell(withIdentifier: "test", for: indexPath) as! ListsTableViewCell
        
        cell.products.text = food.name
        cell.prides.text = food.money
        cell.brands.text = food.brand
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
        if editingStyle == .delete {
                
            let target = DataManagers.shared.want[indexPath.row]
            DataManagers.shared.delete(target)
            
            //데베 뿐만이 아니라 배열에서도 삭제해야한다 (언제나 두 갯수가 같아야한다)
            DataManagers.shared.want.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
                
        }
    }
}
