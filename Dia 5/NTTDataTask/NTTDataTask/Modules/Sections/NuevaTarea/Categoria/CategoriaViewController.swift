//
//  CategoriaViewController.swift
//  NTTDataTask
//
//  Created by Guillermo Rodríguez ALonso on 29/2/24.
//

import UIKit

protocol CategoriaViewControllerDelegate: AnyObject {
    func nombreCategoriaSeleccionada(_ categoriaClass: CategoriaViewController, categoria row: String)
}

class CategoriaViewController: UIViewController {
    
    weak var delegate: CategoriaViewControllerDelegate?
    var nombreCategoriaSeleccionada = ""
    var selectIndexPath = IndexPath()
    var listadoCategorias = ["Sin Categoria", "Tienda de apple", "Bar con los amigos", "En la libreria", "En casa", "En el parque", "En la peluqueria", "En el trabajo"]
    
    @IBOutlet weak var mycategoriasTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupArrayData()
        setupTableView()

        // Do any additional setup after loading the view.
    }

    private func setupArrayData() {
        
        for index in 0..<listadoCategorias.count {
            if listadoCategorias[index] == nombreCategoriaSeleccionada {
                selectIndexPath = IndexPath(row: index, section: 0)
            }
        }
    }

    
    private func setupTableView() {
        self.mycategoriasTableView.delegate = self
        self.mycategoriasTableView.dataSource = self
        self.mycategoriasTableView.register(UINib(nibName: "ListaTareaCell", bundle: nil), forCellReuseIdentifier: "ListaTareaCell")
    }


}


extension CategoriaViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listadoCategorias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellCategoria = self.mycategoriasTableView.dequeueReusableCell(withIdentifier: "ListaTareaCell", for: indexPath) as! ListaTareaCell
        
        cellCategoria.myNombreLabel.text = self.listadoCategorias[indexPath.row]
        return cellCategoria
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath != selectIndexPath{
            selectIndexPath = indexPath
            nombreCategoriaSeleccionada = listadoCategorias[indexPath.row]
            self.delegate?.nombreCategoriaSeleccionada(self, categoria: nombreCategoriaSeleccionada)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
}
