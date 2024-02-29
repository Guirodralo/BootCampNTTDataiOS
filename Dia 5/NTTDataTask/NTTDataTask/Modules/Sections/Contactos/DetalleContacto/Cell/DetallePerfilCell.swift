//
//  DetallePerfilCell.swift
//  NTTDataTask
//
//  Created by Guillermo Rodríguez ALonso on 28/2/24.
//

import UIKit

protocol DetallePerfilCellProtocol {
    func configCell(model: ArrayContact)
}

class DetallePerfilCell: UITableViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var myImagenPerfil: UIImageView!
    @IBOutlet weak var myNombreLabel: UILabel!
    @IBOutlet weak var myApellidoLabel: UILabel!
    @IBOutlet weak var myEmailLabel: UILabel!
    @IBOutlet weak var myLinkedinLabel: UILabel!
    @IBOutlet weak var myDescripcionLabel: UILabel!
    @IBOutlet weak var myExperienciaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
        
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupView() {
        self.myImagenPerfil.layer.cornerRadius = self.myImagenPerfil.frame.width / 2
        self.myImagenPerfil.layer.borderWidth = 1
        self.myImagenPerfil.layer.borderColor = UIColor.white.cgColor
    }
    
}


extension DetallePerfilCell: DetallePerfilCellProtocol {
    
    func configCell(model: ArrayContact) {
        self.myImagenPerfil.image = UIImage(named: model.imageProfile ?? "placeholder")
        self.myNombreLabel.text = model.firstName
        self.myApellidoLabel.text = model.lastName
        self.myEmailLabel.text = model.email
        self.myLinkedinLabel.text = model.cuentaLinkedin
        self.myDescripcionLabel.text = model.descriptionCV
        self.myExperienciaLabel.text = model.experienciaCV
    }
    
}
