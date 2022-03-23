//
//  DetailsViewController.swift
//  fontable
//
//  Created by 홍태희 on 2022/03/23.
//

import UIKit

class DetailsViewController: UIViewController {

    //user가 신청한 목록을 불러와서 뷰 작성 ( 종류세그 제외 )
    @IBOutlet weak var foodName: UILabel! //이름
    @IBOutlet weak var foodikon: UILabel! //상표
    @IBOutlet weak var foodPrice: UILabel! //가격
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
