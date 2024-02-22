//
//  ViewController.swift
//  AppAlerts
//
//  Created by Guillermo Rodríguez ALonso on 21/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    //    MARK: - Variables locales
    var loginTextField: UITextField?
    var passwordTextField: UITextField?
    
    
    
    
    //    MARK: - IBoutlets
    
    @IBOutlet weak var uiAlertControllerSimple: UIButton!
    
    
    
    
    
    
    //    MARK: - IBActions
    
    @IBAction func alertVC(_ sender: AnyObject) {
        switch sender.tag {
            //Simple
        case 0:
            
            self.present(self.myAlertVC(myTitle: "Alert Controller Standard", myMessage: "Este alert controller es la presentación por defecto"), animated: true)
            
            //TextField
        case 1:
            
            let alertVC = UIAlertController(title: "Alert Controller Standard", message: "Este alert controller tiene un TextField", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
            let aceptarAction = UIAlertAction(title: "Aceptar", style: .default, handler: {_ in
                if !(self.loginTextField?.text?.isEmpty ?? false) {
                    let storyboad = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboad.instantiateViewController(withIdentifier: "TercerViewController")
                    self.present(vc, animated: true, completion: nil)
                }
            })
            alertVC.addAction(cancelAction)
            alertVC.addAction(aceptarAction)
            
            alertVC.addTextField { (textResult) in
                self.loginTextField = textResult
                self.loginTextField?.placeholder = "Introduce tu username"
            }
            
            self.present(alertVC, animated: true, completion: nil)
            
            //Login Form
        case 2:
            
            let alertVC = UIAlertController(title: "Alert Controller Standard", message: "Este alert controller formulario login", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
            let aceptarAction = UIAlertAction(title: "Aceptar", style: .default, handler: {_ in
                // Mientras ningun campo este vacio, entra
                if (!(self.loginTextField?.text?.isEmpty ?? false) && !(self.passwordTextField?.text?.isEmpty ?? false)) {
                    let storyboad = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboad.instantiateViewController(withIdentifier: "TercerViewController")
                    vc.modalTransitionStyle = .crossDissolve
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                }
            })
            
            alertVC.addAction(cancelAction)
            alertVC.addAction(aceptarAction)
            
            alertVC.addTextField { (textResult) in
                self.loginTextField = textResult
                self.loginTextField?.placeholder = "Introduce tu username"
            }
            
            alertVC.addTextField { (textResult) in
                self.passwordTextField = textResult
                self.passwordTextField?.placeholder = "Introduce tu password"
                self.passwordTextField?.isSecureTextEntry = true
            }
            
            self.present(alertVC, animated: true, completion: nil)
            
            //Multiple buttons
        case 3:
            
            let alertVC = UIAlertController(title: "Alert Controller Standard", message: "Este alert controller formulario login", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
            alertVC.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            alertVC.addAction(UIAlertAction(title: "Boton 3", style: .destructive, handler: nil))
            alertVC.addAction(UIAlertAction(title: "Boton 4", style: .default, handler: { _ in
                self.choosePhotoLibrary()
            }))
            
            self.present(alertVC, animated: true, completion: nil)
            
            //ActionSheet
        default:
            let alertVC = UIAlertController(title: "Alert Controller Standard", message: "Este alert controller formulario login", preferredStyle: .actionSheet)
            alertVC.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
            alertVC.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            alertVC.addAction(UIAlertAction(title: "Boton 3", style: .destructive, handler: nil))
            alertVC.addAction(UIAlertAction(title: "Boton 4", style: .default, handler: { _ in
                self.choosePhotoLibrary()
            }))
            
            self.present(alertVC, animated: true, completion: nil)
            
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        custamizationButton()
    }
    
    //MARK: - Private methods
    private func custamizationButton() {
        uiAlertControllerSimple.layer.cornerRadius = 20
    }
    
    private func myAlertVC(myTitle: String, myMessage: String) -> UIAlertController{
        let alertVC = UIAlertController(title: myTitle, message: myMessage, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let aceptarAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        alertVC.addAction(cancelAction)
        alertVC.addAction(aceptarAction)
        return alertVC
    }
}


//MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func choosePhotoLibrary() {
        let imagePC = UIImagePickerController()
        imagePC.sourceType = .photoLibrary
        imagePC.delegate = self
        imagePC.allowsEditing = true
        present(imagePC, animated: true, completion: nil)
    }
    
}
