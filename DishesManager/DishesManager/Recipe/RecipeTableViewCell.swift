//
//  RecipeTableViewCell.swift
//  DishesManager
//
//  Created by admin on 23/12/2019.
//  Copyright © 2019 Rinat Kutuev. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    //MARK: Properties
    
    static let idCell = "RecipeCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
