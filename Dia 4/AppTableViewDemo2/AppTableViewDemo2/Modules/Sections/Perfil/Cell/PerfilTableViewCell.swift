//
//  PerfilTableViewCell.swift
//  AppTableViewDemo2
//
//  Created by Guillermo Rodríguez ALonso on 26/2/24.
//

import UIKit

protocol PerfilTableViewCellProtocol {
    func configCell(model: PerfilModel)
}

class PerfilTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var myImageViewPerfil: UIImageView!
    @IBOutlet weak var myUsuarioTwitterLabel: UILabel!
    
    
    @IBOutlet weak var myNombreLabel: UILabel!
    @IBOutlet weak var myPuestoTrabajoLabel: UILabel!
    @IBOutlet weak var myLugarDondeVivoLabel: UILabel!
    @IBOutlet weak var myNumeroSeguidoresLabel: UILabel!
    
    //MARK: - IBActions
    @IBAction func enviaMail(_ sender: Any) {
    }
    
    
    @IBAction func compartirInfo(_ sender: Any) {
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PerfilTableViewCell: PerfilTableViewCellProtocol {
    
    internal func configCell(model: PerfilModel) {
        self.myImageViewPerfil.image = model.imagePerfil
        self.myUsuarioTwitterLabel.text = model.perfilTwitter
        self.myNombreLabel.text = model.nombre
        self.myPuestoTrabajoLabel.text = model.puestoTrabajo
        self.myLugarDondeVivoLabel.text = model.lugarVivo
        self.myNumeroSeguidoresLabel.text = String(model.numeroSeguidores ?? 0)
    }
}
