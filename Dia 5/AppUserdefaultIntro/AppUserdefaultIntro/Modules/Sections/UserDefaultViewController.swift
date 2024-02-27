//
//  UserDefaultViewController.swift
//  AppUserdefaultIntro
//
//  Created by Guillermo Rodríguez ALonso on 27/2/24.
//

import UIKit

class UserDefaultViewController: UIViewController {
    
    
    //MARK: - Outlets
    @IBOutlet weak var myImagenPerfil: UIImageView!
    @IBOutlet weak var myNombretextField: UITextField!
    @IBOutlet weak var myApellidoTextField: UITextField!
    @IBOutlet weak var myDireccionTextField: UITextField!
    @IBOutlet weak var myTelefonoTextField: UITextField!
    @IBOutlet weak var myActualizacionFechaLabel: UILabel!
    
    var existeFoto = false
    
    
    //MARK: - Actions
    @IBAction func salvarDatos(_ sender: Any) {
        
        if !(myNombretextField.text?.isEmpty ?? false) && !(myApellidoTextField.text?.isEmpty ?? false) && !(myDireccionTextField.text?.isEmpty ?? false) && !(myTelefonoTextField.text?.isEmpty ?? false) && existeFoto {
            
            Utils.UserDefaultDDBB.prefs.setValue(self.myNombretextField.text, forKey: Utils.constantes.nombre)
            Utils.UserDefaultDDBB.prefs.setValue(self.myApellidoTextField.text, forKey: Utils.constantes.apellido)
            Utils.UserDefaultDDBB.prefs.setValue(self.myDireccionTextField.text, forKey: Utils.constantes.direccion)
            Utils.UserDefaultDDBB.prefs.setValue(self.myTelefonoTextField.text, forKey: Utils.constantes.telefono)
            
            let fechaActual = Date()
            Utils.UserDefaultDDBB.prefs.setValue(fechaActual, forKey: Utils.constantes.ultimaActualizacion)
            
            let imageData = self.myImagenPerfil.image?.jpegData(compressionQuality: 0.5)
            Utils.UserDefaultDDBB.prefs.setValue(imageData, forKey: Utils.constantes.imagePerfil)
            
            
            present(Utils.showAlertView(title: "HEY", message: "Los datos se han salvado correctamente", callBack: {
                self.myNombretextField.text = ""
                self.myApellidoTextField.text = ""
                self.myDireccionTextField.text = ""
                self.myTelefonoTextField.text = ""
                self.myActualizacionFechaLabel.text = ""
                self.myImagenPerfil.image = UIImage(named: "placeholder")
            }), animated: true, completion: nil)
            
        } else {
            present(Utils.showAlertView(title: "HEY", message: "Rellena los campos", callBack: {
                //
            }), animated: true, completion: nil)
        }
        
    }
    
    @IBAction func recuperarDatos(_ sender: Any) {
        
        if let imageData = Utils.UserDefaultDDBB.prefs.object(forKey: Utils.constantes.imagePerfil) as? Data {
            
            self.myImagenPerfil.image = UIImage(data: imageData)
            
        }
        
        Utils.UserDefaultDDBB.dateFormatter.dateStyle = .medium
        
        if let ultimaActualizacion = Utils.UserDefaultDDBB.prefs.object(forKey: Utils.constantes.ultimaActualizacion) as? Date {
            self.myActualizacionFechaLabel.text = "Ultima actualizacion \(Utils.UserDefaultDDBB.dateFormatter.string(from: ultimaActualizacion as Date))"
        } else {
            self.myActualizacionFechaLabel.text = "Actualizacion no realizada"
        }
        
        
        if let nombreData = Utils.UserDefaultDDBB.prefs.string(forKey: Utils.constantes.nombre) {
            self.myNombretextField.text = nombreData
        }
        
        if let apellidoData = Utils.UserDefaultDDBB.prefs.string(forKey: Utils.constantes.apellido) {
            self.myApellidoTextField.text = apellidoData
        }
        
        if let direccionData = Utils.UserDefaultDDBB.prefs.string(forKey: Utils.constantes.direccion) {
            self.myDireccionTextField.text = direccionData
        }
        
        if let telefonoData = Utils.UserDefaultDDBB.prefs.string(forKey: Utils.constantes.telefono) {
            self.myTelefonoTextField.text = telefonoData
        }
    }
    
    
    //MARK: - Ciclo de vida del controlador
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myImagenPerfil.isUserInteractionEnabled = true
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(showActionGesture))
        self.myImagenPerfil.addGestureRecognizer(tapGR)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - Metodos privados
    @objc
    func showActionGesture() {
        showPickerPhoto()
    }
    
    
}



extension UserDefaultViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showPickerPhoto() {
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickerImage = info[.originalImage] as? UIImage {
            self.myImagenPerfil.contentMode = .scaleAspectFill
            self.myImagenPerfil.image = pickerImage
            self.existeFoto = true
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}




//MARK: - Utils
class Utils {
    
    struct UserDefaultDDBB {
        static let prefs = UserDefaults.standard
        static let dateFormatter = DateFormatter()
    }
    
    //MARK: - Constantes
    struct constantes {
        static let nombre = "NOMBRE"
        static let apellido = "APELLIDO"
        static let direccion = "DIRECCION"
        static let telefono = "TELEFONO"
        static let ultimaActualizacion = "ULTIMA_ACTUALIZACION"
        static let imagePerfil = "IMAGEN_PERFIL"
    }
    
    static func showAlertView(title: String, message: String, callBack: @escaping() -> ()) -> UIAlertController {
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            callBack()
        }))
        return alertVC
    }
}
