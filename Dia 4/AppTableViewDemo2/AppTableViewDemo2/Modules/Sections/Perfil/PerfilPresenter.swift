//
//  PerfilPresenter.swift
//  AppTableViewDemo2
//
//  Created by Guillermo Rodríguez ALonso on 26/2/24.
//

import Foundation
import UIKit


protocol PerfilPresenterProtocol {
    
    func viewDidLoad()
    func getDataCellForRowPost() -> Int
    func getInfomationPerfilCell() -> PerfilModel?
    func getInformationForRowCell(indexPath: Int) -> PostModel
}


final class PerfilPresenter {
    
    let vc: PerfilViewController?
    //var arrayCoches = [CochesModel]()
    
    var perfilModel: PerfilModel? = PerfilModel()
    var postArrayModel: [PostModel] = []
    
    init(vc: PerfilViewController) {
        self.vc = vc
    }

    
}


extension PerfilPresenter: PerfilPresenterProtocol {
    
    func viewDidLoad() {
        self.getPerfilData()
        self.getArrayData()
        self.vc?.reloadData()
    }
    
    func getPerfilData() {
        perfilModel = PerfilModel(imagePerfil: UIImage(named: "thor"),
                                  perfilTwitter: "@twitterDeThor",
                                  nombre: "Thor",
                                  puestoTrabajo: "Super martillo",
                                  lugarVivo: "En la qinta dimension",
                                  numeroSeguidores: 200)
    }
    
    
    func getArrayData() {
        postArrayModel.removeAll()
        postArrayModel = [PostModel(perfil: PerfilModel(imagePerfil: UIImage(named: "Miranda_Lambert"),
                                                       perfilTwitter: "@MirandaTwitter",
                                                       nombre: "Miranda Lambert",
                                                       puestoTrabajo: "Cantante",
                                                       lugarVivo: "Nueva York",
                                                       numeroSeguidores: 300),
                                   tituloPosteo: "Loren ipsum es lo mejor para imprimir texto falso",
                                   mensjaePosteo: "Loren ipsum es lo mejor para imprimir texto falso,\n Loren ipsum es lo mejor para imprimir texto falso, \n Loren ipsum es lo mejor para imprimir texto falso",
                                   fuentePosteo: "El Pais.com",
                                   numeroLikes: 100,
                                   numeroComentarios: 25,
                                   horaPublicacion: Date())]
    }
    
    func getDataCellForRowPost() -> Int {
        return postArrayModel.count
    }
    
    func getInfomationPerfilCell() -> PerfilModel? {
        return self.perfilModel
    }
    
    func getInformationForRowCell(indexPath: Int) -> PostModel {
        return postArrayModel[indexPath]
    }
}
