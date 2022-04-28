//
//  ListsViewController.swift
//  fontable
//
//  Created by 홍태희 on 2022/03/17.
//

import UIKit
import CoreData

class ListsViewController: UIViewController {
    
    @IBOutlet weak var tableViews: UITableView?
        
    @IBOutlet weak var foodName: UITextField?
    @IBOutlet weak var priceName: UITextField?
    @IBOutlet weak var brandName: UITextField?
    
    @IBAction func addList(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let reqVC = storyBoard.instantiateViewController(withIdentifier: "request")
        reqVC.modalPresentationStyle = .overCurrentContext
        present(reqVC, animated: true, completion: nil)
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addBtn(_ sender: Any) {
        //만약, 빈칸이 있다면 빈칸 채우라고 안내하기 ( 다채워졌다면 등록여부 묻는 Alert 띄우고 저장하고 tableview에 띄우기
        
        //확인 얼럿
        let alert = UIAlertController(title: "등록", message: "정말 등록하시겠습니까?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "네", style: .destructive) { [self](action) in
            
            //CoreData에 save ( 팝업창에 있는 textfield에 작성된 데이터를 CoreData에 save )
            DataManagers.shared.save(brand: (foodName?.text)!, money: (priceName?.text)!, name: (brandName?.text)!)
            
            //CoreData에 있는 save된 textfireld Data 가져오기
            DataManagers.shared.loadDatas()
            
            //tableview에 로드
            self.tableViews?.reloadData()
            
            //팝업창 없앰
            self.dismiss(animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "아니요", style: .default, handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        DataManagers.shared.loadDatas()
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
        
        //NSManagedObject에서 attribute 가져오기 ( KVC -> Key-Value Coding )
        cell.products.text = food.name
        cell.prides.text = food.money
        cell.brands.text = food.brand
        
//        cell.products.text = food.value(forKeyPath: "name") as? String
//        cell.prides.text = food.value(forKeyPath: "money") as? String
//        cell.brands.text = food.value(forKeyPath: "brand") as? String
        
        return cell
    }
}
