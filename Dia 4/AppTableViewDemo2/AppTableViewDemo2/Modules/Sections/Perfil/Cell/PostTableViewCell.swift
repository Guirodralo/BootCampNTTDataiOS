//
//  PostTableViewCell.swift
//  AppTableViewDemo2
//
//  Created by Guillermo Rodríguez ALonso on 27/2/24.
//

import UIKit
protocol PostTableViewCellProtocol {
    func configCell(model: PostModel)
}


class PostTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var myMensajePostLabel: UILabel!
    @IBOutlet weak var myImagenPost: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


extension PostTableViewCell: PostTableViewCellProtocol{
    
    internal func configCell(model: PostModel) {
        self.myMensajePostLabel.text = model.mensajePosteo
        self.myImagenPost.image = model.imagenPost
        
    }
}
