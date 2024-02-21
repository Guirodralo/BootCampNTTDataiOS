import UIKit

// -> Comentario de una linea

/*
 -> Comentario de varias lineas
 */

//MARK: - Tipos basicos

var nombre: String = "pepe" // var -> define una propiedad mutable

let apellido: String = "ramírez" // var -> define una propiedad mutable

nombre = "Felipe"
//apellido = "ocampo"

let profesion = "iOS Developer"

print(profesion)

print("El Sr. \(nombre + apellido), es \(profesion)")

//NSLog(@"el Sr. %@, es %@", nombre, profesion)

var numeroA: Int = 4
var numeroB = 3.8

var multiplacion = Double(numeroA) * numeroB

typealias EnteroAndres = Int

var numeroC: EnteroAndres = 5

multiplacion = multiplacion + Double(numeroC)

var numeroH = 1, numeroG = 4, numeroL = 5

print(numeroH)


//MARK: - Operadores
var numeroD = 0
numeroD = 2 * 5 + 7

//Incrementa en 1
numeroD += 1

print(numeroD)

numeroD -= 10

var sino: Bool = true

if sino {
    print("Correcto")
} else {
    print("Incorrecto")
}


if nombre.isEmpty || apellido.isEmpty {
    print("coloca datos")
} else {
    print("Ya existen datos")
}

if numeroD >= 7 {
    print("Correcto")
} else {
    print("Incorrecto")
}

var resultado = numeroD != 0 ? numeroA/Int(numeroB) : 0

print(resultado)


//MARK: - String - characters

var emptyString = ""
var anotherEmptyString = String()
var despedida = "Hola!"

emptyString.isEmpty
despedida.isEmpty

var variableStringMutable = "Andres"
variableStringMutable += "Felipe"
variableStringMutable += "Ocampo"
variableStringMutable += "Eljaiek"

for index in despedida {
    print(index)
}

let exclamacion: Character = "!"

despedida += String(exclamacion)

var categoriaCharacters: [Character] = ["C", "b", "r", "T"]

categoriaCharacters.append("G")

var catString = String(categoriaCharacters)

print(catString)

let animalesInusuales = "Koala _ ?, Ronoceronte ?, Finguino ?, DrummerdariusalexusGregours ?"

print("Animales inusuales \(animalesInusuales.count) caracteres")


var bienvenidosASwift = "Hola"
bienvenidosASwift.insert("!", at: bienvenidosASwift.endIndex)
bienvenidosASwift.insert(contentsOf: "a vosotros", at: bienvenidosASwift.endIndex)

print(bienvenidosASwift)

//MARK: - Arrays (matrices -> Colecciones)

var iPhones = ["iphone 4", "iphone 5", "iphone Xr", "iphone X"]
var iPads = ["iPad Air", "iPad Pro", "iPad Mini retina"]

var dispositivos = iPhones + iPads

dispositivos
    .append("MacBook Pro")
dispositivos
    .insert("iWatch 24mm", at: 0)
dispositivos
    .remove(at: 5)
print(dispositivos)

dispositivos
    .sort(by: >)

let iPhone5 = dispositivos[2]

let lastPosition = dispositivos.last
let firstPosition = dispositivos.first

let aux = dispositivos.filter{ ($0.contains("iphone 4")) }
print(aux)

//MARK: - Diccionarios (matrices -> Colecciones)

var diccionariosVacios: [String: Any] = [:]
var otroDiccionario = Dictionary<String, Any>()

var coche: [String:String] = ["marca":"Mazda",
                              "modelo":"Megane",
                              "potencia": "145 caballos"]

let marca = coche["marca"]

// Aqui desempaquetamos pero no lo tenemos que hacer asi
if coche["modelo"] != nil {
    print(coche["modelo"]!)
}

// tenemos que hacerlo asi, porque lo estamos usando con una variable temporal
if let modelo = coche["modelo"] {
    print(modelo)
    print(marca ?? "")
} else {
    
}

for (clave, valor) in coche {
    print("Clave: \(clave) y valor: \(valor)")
}

for clave in coche.keys {
    print(clave)
}

for value in coche.values {
    print(value)
}


//MARK: - Opcionales(Optional binding)

var numeroEntero = 34
var numeroString = "3"

var sumaNumeroEntStr = numeroEntero + Int(numeroString)!

var nuevasuma: String = String(sumaNumeroEntStr)

var nuevaSumaString: String = numeroString + String(numeroEntero)

var nombreAA: String? = "Andres"
nombreAA = "Felipe"

var nombreBB: String? = nil
var nombreModA: String!

if let nombreModADes = nombreModA{
    print("Mi nombre es \(nombreModADes)")
}

var xOptional: Int?
xOptional = 2
var nuevoValorOptional: String?
nuevoValorOptional = String(xOptional ?? 0)
var ySumatoria: Int = 20
var resultadoSumatoriaXY = nuevoValorOptional! + String(ySumatoria)

if let resultadoSumatoria = nuevoValorOptional {
    print(resultadoSumatoria)
}


//MARK: -Funciones

func miSerieFavorita() {
    print("Perdidos")
}

miSerieFavorita()

func funcionRetornaString () -> String {
    "Hola mundo"
}

let varRetornoString = funcionRetornaString()

print(varRetornoString)

func miFuncionConAtributos(mensaje: String){
    print(mensaje)
}

miFuncionConAtributos(mensaje: "hola")

func numerosSecuencia (a: Int, b: Int, c: Int) -> Int {
    return (a * b) + c
}

let numerosSec = numerosSecuencia(a: 2, b: 4, c: 1)

print(numerosSec)

func hola(nombrePersona: String) -> String {
    let saludo = "Hola" + " " + nombrePersona + "!"
    return saludo
}

var saludara = hola(nombrePersona: "Andres")
print(saludara)

func holaDeNuevo(nombrePersona: String) -> String {
    let saludo = "Hola" + " " + nombrePersona + "!"
    return saludo
}

func holaAmigos(nombrePersona: String, listoSaludar: Bool) -> String {
        if listoSaludar {
            return hola(nombrePersona: "Andres")
        } else {
            return holaDeNuevo(nombrePersona: "Felipe")
        }
    
}

print(holaAmigos(nombrePersona: "Andres", listoSaludar: true))

func mutacionParametros(a: Int, b: Int, multiply c:Int) -> Int {
//    var aux = 3
//    c = aux
    return (a + b) + c
}

mutacionParametros(a: 2, b: 3, multiply: 4)

var numeroPi = 3

//Si ponemos inout delante del tipo lo hacemos mutable a ese parametro
func funcionInOut(numero: inout Int){
    numero += 3
}

funcionInOut(numero: &numeroPi)
print(numeroPi)
