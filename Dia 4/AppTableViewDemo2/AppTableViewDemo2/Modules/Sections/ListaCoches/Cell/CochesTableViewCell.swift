//
//  CochesTableViewCell.swift
//  AppTableViewDemo2
//
//  Created by Guillermo Rodríguez ALonso on 26/2/24.
//

import UIKit

protocol CochesTableViewCellProtocol {
    func configCell(model: CochesModel)
}

class CochesTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var myImageViewCoches: UIImageView!
    @IBOutlet weak var myMarcaLabel: UILabel!
    @IBOutlet weak var myColorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


extension CochesTableViewCell: CochesTableViewCellProtocol {
    internal func configCell(model: CochesModel){
        self.myMarcaLabel.text = model.name
        self.myColorLabel.text = model.color
        self.myImageViewCoches.image = model.image
    }
}
