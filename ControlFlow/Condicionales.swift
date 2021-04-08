//Colacar el peso en libras ------------------
func bodyMaxIndex(weight : Double, height : Double) -> String{

    let bmi : Double = (weight/2.2046) / pow(height, 2) //Formula exponencial con la funcion "pow"
    var result : String = ""
    let bmidec = String(format: "%.2f", bmi) // Trabajar con los decimales
    if bmi > 25 {
        result = "Hey, you are overweight! with \(bmi)" // Se denomina String interpolation
    }else if bmi > 18.5 {
        result = "Don't worry, your weight is normal with " + String(bmi) //Se denomina Casting
    }else {
        result = "Hey you are underweight!"
    }
    return "Your BMI is \(bmidec) and \(result)"
}
