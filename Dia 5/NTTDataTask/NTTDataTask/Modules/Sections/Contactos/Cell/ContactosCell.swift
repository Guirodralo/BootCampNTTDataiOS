//
//  ContactosCell.swift
//  NTTDataTask
//
//  Created by Guillermo Rodríguez ALonso on 28/2/24.
//

import UIKit

protocol ContactosCellProtocol {
    func configCell(data: ArrayContact)
}


class ContactosCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var myImagenPerfil: UIImageView!
    @IBOutlet weak var myNombreLabel: UILabel!
    @IBOutlet weak var myApellidoLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.myImagenPerfil.layer.cornerRadius = self.myImagenPerfil.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}



extension ContactosCell: ContactosCellProtocol {
    
    internal func configCell(data: ArrayContact) {
        self.myImagenPerfil.image = UIImage(named: data.imageProfile ?? "placeholder")
        self.myNombreLabel.text = data.firstName
        self.myApellidoLabel.text = data.lastName
        
    }
    
    
}
