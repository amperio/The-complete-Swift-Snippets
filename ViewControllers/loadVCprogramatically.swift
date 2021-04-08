import UIKit

class SecondViewController: UIViewController {
    
    var dato = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        let labelDato = UILabel()
        // CGRect: Core Graphics Rectangle
        labelDato.text = dato
        labelDato.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        view.addSubview(labelDato)
    }
}

// *******************************************************************
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

@IBAction func btn_calculate(_ sender: UIButton) {
        let result = 45.79787
        let secondVC = SecondViewController()
        secondVC.dato = String(format: "%.2f", result)
        self.present(secondVC, animated: true, completion: nil)
    }
}
