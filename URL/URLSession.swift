import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl_ubicacion: UILabel!
    @IBOutlet weak var lbl_resultado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // WITH THE DEFAULT KIND OF SESSION ------------------------------------------------------------------------------------------
    
    @IBAction func btn_request(_ sender: UIButton) {
        
        // Valor que identifica la ubicacion de recursos en un servidor web o la ruta a un archivo local
        let api = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=b3ceaef88d93238d6f3c0cfe6212bf48&q=guayaquil"
        if let url = URL(string: api){
            
            // Objeto que coordina tareas de transferencia de datos en la red
            // Se usa instancias de URLSession para crear una o mas instancias de URLSessiontASK
            let urlsession = URLSession(configuration: .default)
            
            // Tareas como enviar y traer datos desde la app, descargar, subir archivos remotos
            // DENTRO DE UNA SESION SE PUEDE ASOCIAR VARIAS TAREAS, QUE SON REPRESENTADAS POR SOLICITUDES URLs
            let sessionTask = urlsession.dataTask(with: url, completionHandler: {(data,response,error) in
                if error != nil {
                    print(error!)
                    retutn
                }
                if let datasession = data{
                    
                    // DataTask request a resource, returning the server's response as one or more NSData objects in memory
                    print(datasession)
                    print("Datos recibidos")
                }
            })
            
            // Reanuda la tarea si ha sido suspendida
            // TAREAS NUEVAS INICIALIZADAS, EMPIEZAN EN ESTADO SUSPENDIDO, POR LO QUE HAY QUE LLAMAR A ESTE METODO
            sessionTask.resume()
        }
    }
    
    // WITH THE SINGLETON SHARED KIND OF SESSION -----------------------------------------------------------------------------------
    
    @IBAction func btn_request(_ sender: UIButton) {
        
        // Valor que identifica la ubicacion de recursos en un servidor web o la ruta a un archivo local
        let api = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=b3ceaef88d93238d6f3c0cfe6212bf48&q=guayaquil"
        if let url = URL(string: api){
            
            // URLSession: Coordina grupos de tareas de transferencia de datos en la red
            // .SHARED: Session for basic request
            // .DATATASK: Se crea tarea de traer contenido de una URL
            URLSession.shared.dataTask(with: url, completionHandler: {(data,response,error)in
                if error != nil{
                    print(error!)
                    return
                }
                if let datasession = data{
                    print(datasession)
                }
            }).resume() // Reanuda la tarea si ha sido suspendida
            // TAREAS NUEVAS INICIALIZADAS, EMPIEZAN EN ESTADO SUSPENDIDO, POR LO QUE HAY QUE LLAMAR A ESTE METODO
        }
    }
}
