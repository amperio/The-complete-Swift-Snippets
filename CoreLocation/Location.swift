import UIKit
import CoreLocation // Libreria para obtener ubicacion geografica y orientacion del dispositivo

class ViewController: UIViewController {

    @IBOutlet weak var lbl_ubicacion: UILabel!
    
    let locationManager = CLLocationManager() // Configurar, empezar, o parar los servicios de ubicacion del dispositivo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Solicitar permiso al usuario para poder usar los servicios de ubicacion, la descripcion que se muestre, sera de la key: 'Location when In Use Usage Description' del archivo info.plist
        // Texto que se mostrara: "We need your location to get the current weather from where you are"
        locationManager.requestWhenInUseAuthorization()
        
        // Assign the delegate before starting any location services
        locationManager.delegate = self
        
        // La presicion de el dato de la ubicacion a recibir (por defecto es: kCLLocationAccuracyBest)
        // locationManager.desiredAccuracy = kCLLocationAccuracyReduced
        
        // Solicitar solo una vez la ubicacion del dispositivo, el metodo para el servicio de ubicacion automaticamente (no confiarse)
        locationManager.requestLocation()
    }
}

// MARK: - CLLocationManagerDelegate --------------------------------------------------------------------------------------------------------

// Metodo que se ejecuta cuando se instancia un objeto LocationManager, y de nuevo cuando ha habido un cambio en las autorizaciones de la app.
extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("Hubo un cambio en los servicios de ubicacion")
    }
    
    // Metodo que se ejecuta si ha habido un error, The locationManager was unable to retrive a location value
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    // Method that tells that the new location data is available
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Escogemos el ultimo elemnto del Array (.last), devido a que este es el que tendra mas presicion
        if let ubicacion = locations.last{
            let lat = ubicacion.coordinate.latitude
            let lon = ubicacion.coordinate.longitude
            lbl_ubicacion.text = "Latitud: \(lat) \nLongitud: \(lon)"
            
            // Metodo para cancelar una solicitud pendiente (para prevenir que el servicio de ubicacion se quede activo)
            locationManager.stopUpdatingLocation()
        }
    }
}
