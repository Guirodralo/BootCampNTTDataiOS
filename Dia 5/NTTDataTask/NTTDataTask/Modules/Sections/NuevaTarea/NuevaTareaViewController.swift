//
//  NuevaTareaViewController.swift
//  NTTDataTask
//
//  Created by Guillermo Rodríguez ALonso on 29/2/24.
//

import UIKit
import SwiftUI

class NuevaTareaViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var arrayPrioridad = ["ALTA", "MEDIA - ALTA", "MEDIA", "BAJA", "SIN PRIORIDAD"]
    let TEXT_FIELD_LIMIT = 140
    var nombreCategoria = "Sin Categoría"
    var fotoSeleccionada = false
    
    //MARK: - IBOUTLET
    @IBOutlet weak var myNuevaTareaTF: UITextField!
    @IBOutlet weak var myPrioridadNuevaTareaTF: UITextField!
    @IBOutlet weak var myFechaNuevaTarea: UITextField!
    @IBOutlet weak var myPresentaNuevaCategoriaLBL: UILabel!
    @IBOutlet weak var myCategoriaButton: UIButton!
    @IBOutlet weak var mySalvarTareaButton: UIButton!
    @IBOutlet weak var myImagenNuevaTareaIV: UIImageView!
    @IBOutlet weak var myContadorCaracteres: UILabel!
    @IBOutlet weak var descripcionTarea: UITextField!
    
    
    //MARK: - Actions
    @IBAction func salvarTareaUD(_ sender: Any) {
        
        if !(self.myNuevaTareaTF.text?.isEmpty ?? false) && !(self.descripcionTarea.text?.isEmpty ?? false) && fotoSeleccionada {
            
            if let imageData: Data = self.myImagenNuevaTareaIV.image?.jpegData(compressionQuality: 0.5) {
                SaveFavoritesPresenter.shared.addLocal(favorite: DownloadNewModel(pId: Int.random(in: 0...999),
                                                                                  pNewTask: self.myNuevaTareaTF.text ?? "",
                                                                                  pPriority: self.myPrioridadNuevaTareaTF.text ?? "",
                                                                                  pTaskDate: self.myFechaNuevaTarea.text ?? "",
                                                                                  pTaskDescription: self.descripcionTarea.text ?? "",
                                                                                  pTaskCategory: self.myPresentaNuevaCategoriaLBL.text ?? "",
                                                                                  pTaskImage: imageData)) { (sucess) in
                    print("Aqui se han salvado")
                } failure: { (error) in
                    print("NO se han guardado")
                }

            }
        } else {
            print("alerta")
        }
        
        
        
        
    }

    
    
    @IBAction func muestraListaCategorias(_ sender: Any) {
        
        let vc = CategoriaViewController()
        vc.delegate = self
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func setupViews() {
        //1
        self.myCategoriaButton.layer.cornerRadius = 10
        self.mySalvarTareaButton.layer.cornerRadius = 10
        
        //2
        self.myImagenNuevaTareaIV.layer.cornerRadius = 8
        self.myImagenNuevaTareaIV.layer.borderWidth = 1
        self.myImagenNuevaTareaIV.layer.borderColor = UIColor.black.cgColor
        self.myImagenNuevaTareaIV.isUserInteractionEnabled = true
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(showPickerImage))
        self.myImagenNuevaTareaIV.addGestureRecognizer(tapGR)
        
        //3
        let pickerView = UIPickerView()
        pickerView.delegate = self
        self.myPrioridadNuevaTareaTF.inputView = pickerView
        self.myPrioridadNuevaTareaTF.text = arrayPrioridad[0]
    }
    
    
    @objc
    func showPickerImage() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            showPhotoMenu()
        } else {
            choosePhotoFromLibrary()
        }
    }
    
    func showPhotoMenu() {
        let actionSheet = UIAlertController(title: "Selecciona la opcion", message: "", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "tomar foto", style: .default, handler: { _ in
            self.takePhotoWithCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Escoge de la libreria de fotos", style: .default,handler: { _ in
            self.choosePhotoFromLibrary()
        }))
        present(actionSheet, animated: true, completion: nil)
    }
    
    func takePhotoWithCamera() {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func choosePhotoFromLibrary() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
}


//MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension NuevaTareaViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            myImagenNuevaTareaIV.contentMode = .scaleAspectFill
            myImagenNuevaTareaIV.image = pickedImage
            fotoSeleccionada = true
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}


//MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension NuevaTareaViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayPrioridad.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayPrioridad[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.myPrioridadNuevaTareaTF.text = arrayPrioridad[row]
    }
    
}


//MARK: - CategoriaViewControllerDelegate
extension NuevaTareaViewController: CategoriaViewControllerDelegate {
    func nombreCategoriaSeleccionada(_ categoriaClass: CategoriaViewController, categoria row: String) {
        self.myPresentaNuevaCategoriaLBL.text = row
    }
    

}
