import UIKit
import Firebase
import PopupDialog

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
  // LOGIN METODO
    @IBAction func btn_login(_ sender: UIButton) {
        if let email = txt_email.text, let paswword = txt_password.text{
            Auth.auth().signIn(withEmail: email, password: paswword) { (authDataResult, error) in
                if let error = error{
                    let title = "ERROR DE INICIO DE SESIÓN"
                    let message = "ERROR: \(error.localizedDescription)"
                    let popup = PopupDialog(title: title, message: message)
                    let button = DefaultButton(title: "OK", height: 60, dismissOnTap: true, action: nil)
                    popup.addButton(button)
                    self.present(popup, animated: true) {
                        self.txt_email.text = ""
                        self.txt_password.text = ""
                    }
                }else{
                    self.performSegue(withIdentifier: "goToHomeL", sender: self)
                }
            }
        }
    }
  
  // ------------------------------------------------------------------------------------------------------------------------------
  // REGISTRO METODO
   @IBAction func btn_registrar(_ sender: UIButton) {
        if let correo = txt_correo.text, let password = txt_password.text{
            Auth.auth().createUser(withEmail: correo, password: password) { (authDataResult, error) in
                if let err = error{
                    let title = "EROR DE REGISTRO"
                    let message = "ERROR: \(err.localizedDescription)"
                    let popup = PopupDialog(title: title, message: message)
                    let buttomDismiss = DefaultButton(title: "OK", height: 60, dismissOnTap: true, action: nil)
                    popup.addButton(buttomDismiss)
                    self.present(popup, animated: true) {
                        self.txt_correo.text = ""
                        self.txt_password.text = ""
                    }
                }else{
                    self.performSegue(withIdentifier: "goToHomeR", sender: self)
                }
            }
        }
    }
  
}
