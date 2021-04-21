
import Foundation

// Pinguino
// Aguila
// Avion
// Pajaro

protocol PoderVolarProtocol {
    func volar()
}

class Pajaro {
    func ponerHuevo() {
        print("Puede poner huevos")
    }}

class Pinguino: Pajaro {
    func nadar() {
        print("Puedo nadar tambien!")
    }
}

class Aguila: Pajaro, PoderVolarProtocol {
    func volar() {
        print("Soy un aguila y puedo volar!")
    }
}

struct Avion: PoderVolarProtocol {
    func volar() {
        print("Maquina que puede volar")
    }
}

struct Aviadores {
    func museoAviodaros(voladores: PoderVolarProtocol) {
        print(voladores.volar())
    }
}

let pinguino1 = Pinguino()
let aguila1 = Aguila()
let avion1 = Avion()

let aviadores1 = Aviadores()
aviadores1.museoAviodaros(voladores: avion1)

