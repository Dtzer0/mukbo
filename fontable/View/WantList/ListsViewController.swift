//
//  ListsViewController.swift
//  fontable
//
//  Created by 홍태희 on 2022/03/17.
//

import UIKit

class ListsViewController: UIViewController {
    
    @IBOutlet weak var tableViews: UITableView!
    
    @IBAction func addList(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let reqVC = storyBoard.instantiateViewController(withIdentifier: "request")
        reqVC.modalPresentationStyle = .overCurrentContext
        present(reqVC, animated: true, completion: nil)
    }
    
    let testarray = ["너가좋아하는까까", "수미칩허니머스타드", "가나초콜릿다크"]
    let testcells = ["12000", "2500", "800"]
    let testbrands = ["지구를위하여", "농심", "롯데"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViews.delegate = self
        tableViews.dataSource = self
    }

}

extension ListsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableViews.dequeueReusableCell(withIdentifier: "test", for: indexPath) as! ListsTableViewCell
        cell.products.text = testarray[indexPath.row]
        cell.prides.text = testcells[indexPath.row]
        cell.brands.text = testbrands[indexPath.row]
        
        return cell
    }
}
