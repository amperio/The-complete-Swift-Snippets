var arrayExam : [Int] = [1,3,5,8,1,5,8]
var i : Int = 0
var result : Int = 0

while i != arrayExam.count { // El numero de elementos del array
    result = result + arrayExam[i]
    i += 1
}
print(result)
