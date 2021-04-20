import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var lblName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Delegar a la clase actual, para recibir reportes de aciones que realiza el usario sobre el objeto UITextfield.
        textInput.delegate = self
    }
    
    @IBAction func txtAction(_ sender: UITextField) {
        //  This method run when the user tap the textfield. (Behind the scene the text field becomes the first responder automatically)
    }
    
    //  Metodo que se ejecuta cuando el boton return es presionado
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        lblName.text = "GRACE"
        // Notifies that it has been asked to relinquish its status as first responder in the window, two options :
        textField.endEditing(true)
        textField.resignFirstResponder()
        return true // Se implementa el comportamiento por defecto para el return button
    }
    
    // Ask delegate to stop editing in the specified textfield
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text == ""{
            return false
        }else{
            return true
        }
    }
}
