import Foundation

// Objeto Random - randomElement ; Int.random(0...VALUE) || Int.random(0..<VALUE)
// Form 1
let listita = ["Juan","Edith","Paula","Stefania"]
let elegido = listita.randomElement() //let is for constant variables
print(elegido ?? "Error") // Nil-Coalescing Operator
// Form 2
let indice = Int.random(0...listita.count) // The three dots specify a range
print(listita[indice])

// Al igual que 'Int', se puede aplicar para los otros tipos de datos, Float, Double, Booleans (en booleans solo abran dos posibilidades)

// Refactoring is when we take our code and try to make it simple
