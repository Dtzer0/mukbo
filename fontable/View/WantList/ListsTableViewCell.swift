//
//  ListsTableViewCell.swift
//  fontable
//
//  Created by 홍태희 on 2022/03/17.
//

import UIKit

class ListsTableViewCell: UITableViewCell {

    @IBOutlet weak var products: UILabel!
    @IBOutlet weak var prides: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        contentView.addSubview(products)
        contentView.addSubview(prides)
    }

}
