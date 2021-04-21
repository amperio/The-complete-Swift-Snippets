import Foundation

class Persona {
    // Variables de tipo, es decir que estan asociado al tipo, y no en la instancia.
    
    // Diferencia entre static y class
    // Static y class asocian las cosas al tipo y no a la instancia
    // Con class puede ser con variables de tipo o con funciones, al igual que static, a diferencia cuando es con variables de tipo, debe ser estrictamente con variables computadas y no almacendas
    // Cuando hacemos algo de tipo static, no lo podremos sobreescribir en una herencia (si heredamos no lo podremos sobreescribir), si hacemos algo de tipo class si lo podremos sobreescribir
    static var nombre : String = "Juan" // variables almacenadas
    class var edad : Int { // Variables computadas
        return 25
    }
    
    static: is a type property requirement
    var: is a instance property requirement
}
