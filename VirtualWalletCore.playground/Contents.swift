import UIKit

var persona = Persona(nombre: "Josue", apellido: "Bravo")
persona.cuenta = Cuenta(cuenta: 1500, descripcion: "Enero")

let alimentoSnow = Presupuesto(categoria: .alimentoSnow, cantidad: 150, descripcion: "Comida snow")
let alimento = Presupuesto(categoria: .alimento, cantidad: 300, descripcion: "Comida")


persona.cuenta?.agregar(presupuesto: alimentoSnow)
persona.cuenta?.agregar(presupuesto: alimento)


do {
    try persona.cuenta?.agregarTransaccion(
        transaccion: .gasto(
            cantidad: 600,
            descripcion: "Comida semanal",
            categoria: .alimento,
            fecha: Date(anio: 2020, mes: 01, dia: 7)
        )
    )
} catch {
    print("Error in Comida semanal", error)
}

do {
    try persona.cuenta?.agregarTransaccion(
        transaccion: .gasto(
            cantidad: 200,
            descripcion: "Comida semanal",
            categoria: .alimento,
            fecha: Date(anio: 2020, mes: 01, dia: 7)
        )
    )
} catch {
    print("Error in Comida semanal", error)
}

print(persona.cuenta?.presupuestoDe(categoria: .alimento) ?? 0);

do {
    try persona.cuenta?.agregarTransaccion(
        transaccion: .gasto(
            cantidad: 200,
            descripcion: "Comida semanal",
            categoria: .alimento,
            fecha: Date(anio: 2020, mes: 01, dia: 7)
        )
    )
} catch {
    print("Error in Comida semanal", error)
}

print(persona.cuenta?.transacciones ?? "")
