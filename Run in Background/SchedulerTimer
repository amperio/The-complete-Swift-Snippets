import AVFoundation

trueButton.backgroundColor = UIColor.green
falseButton.backgroundColor = UIColor.red

Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

@objc func updateUI(){
  trueButton.backgroundColor = UIColor.Clear
  falseButton.backgroundColor = UIColor.Clear
}

// Primero el color de fondo de los botones 'trueButton' y 'falseButton' son de verde y rojo
// Luego se agenda un timer para que se ejecute pasado los 0.2 segundos y asi los fondos de los botones vuelvan a tener un fondo sin color, dando el efecto requerido
