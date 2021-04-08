var loopResult : Int = 0
for costant in arrayExam { // "constant" will represent a single element inside the array. The loop is going to look through this array and it's going to assign a constant to every single items
    loopResult += costant
}
print(loopResult)

for i in 1 ... 10 where i % 2 == 0{ //Using open range
    print(i)
}


//Loop Challenge --------------------
func cuenta(liness tope: Int) { // The first name is the outside parameter name and the second is the internal parameter name
    for i in (1 ... tope).reversed() {  // Retorna los elementos en un orden reverso
        if i != 1 {
            print("\(i) bottles of beer on the wall, \(i) bottles of beer.\n Take one down and past it around. \(i-1) bottles of beer on the wall\n")
        }else {
            print("\(i) bottle of beer on the wall, \(i) bottle of beer.\n Take one down and past it around. No more bottles of beer on the wall\n")
        }
    }
    print("No more bottles of beer on the wall, no more bottles of beer.\n Go to the store and buy some more, 99 bottles of beer n the wall")
}
//Swift has the hability to define  both an internal and external parameter
//Intead of having an extension parameter I can change it to undersocre "_", and that means I don't have to use an external parameter, solomlo uso cuando el nombre de mi funcion no  esta siendo los suficiente descriptivo
cuenta(liness: 99)


//Ejercicio Fibonacci --------------------
func fibonacci(until n : Int){
    var i : Int = 0, p : Int = 1, q : Int = 0
    for _ in 1 ... n { //Si no usamos el valor constante del for, colocamos un "_" en su lugar
        q = i + p
        print("\(q)")
        i = p
        p = q
    }
}
fibonacci(until: 9)
