import UIKit

var persona = Persona(nombre: "Josue", apellido: "Bravo")
persona.cuenta = Cuenta(cuenta: 0, descripcion: "Enero")

let alimentoSnow = Presupuesto(categoria: .alimentoSnow, cantidad: 150, descripcion: "Comida snow")
let alimento = Presupuesto(categoria: .alimento, cantidad: 300, descripcion: "Comida")
let transporte = Presupuesto(categoria: .transporte, cantidad: 30, descripcion: "Transporte")
let celular = Presupuesto(categoria: .celular, cantidad: 100, descripcion: "Linea telefónica")
let entretenimiento = Presupuesto(categoria: .entretenimiento, cantidad: 70, descripcion: "Entretenimiento")
let renta = Presupuesto(categoria: .renta, cantidad: 80, descripcion: "Pago casa")
let estudio = Presupuesto(categoria: .estudio, cantidad: 100, descripcion: "Cursos de Platzi")
let ahorro = Presupuesto(categoria: .ahorro, cantidad: 300, descripcion: "Ahorro")
let presupuestoExtra = Presupuesto(categoria: .extra, cantidad: 50, descripcion: "Otros")

persona.cuenta?.agregarPresupuesto(alimentoSnow)
persona.cuenta?.agregarPresupuesto(alimento)
persona.cuenta?.agregarPresupuesto(transporte)
persona.cuenta?.agregarPresupuesto(celular)
persona.cuenta?.agregarPresupuesto(entretenimiento)
persona.cuenta?.agregarPresupuesto(renta)
persona.cuenta?.agregarPresupuesto(estudio)
persona.cuenta?.agregarPresupuesto(ahorro)
persona.cuenta?.agregarPresupuesto(presupuestoExtra)


// Sueldo
do {
    try persona.cuenta?.agregarTransaccion(
        .ingreso(
            cantidad: 1500,
            descripcion: "Sueldo Mensual",
            fecha: Date(anio: 2020, mes: 01, dia: 07)
        )
    )
} catch  {
    print("Error al agregar el sueldo.", error)
}


// Gastos mensuales
do {
    try persona.cuenta?.agregarTransaccion(
        .gasto(
            cantidad: 80,
            descripcion: "Casa",
            categoria: .renta,
            fecha: Date(anio: 2020, mes: 01, dia: 07)
        )
    )
} catch {
    print("Casa", error)
}

do {
    try persona.cuenta?.agregarTransaccion(
        .gasto(
            cantidad: 44.90,
            descripcion: "Netflix",
            categoria: .entretenimiento,
            fecha: Date(anio: 2020, mes: 01, dia: 07)
        )
    )
} catch {
    print("Netflix", error)
}

do {
    try persona.cuenta?.agregarTransaccion(
        .gasto(
            cantidad: 18.90,
            descripcion: "Spotify",
            categoria: .entretenimiento,
            fecha: Date(anio: 2020, mes: 01, dia: 07)
        )
    )
} catch {
    print("Spotify", error)
}

do {
    try persona.cuenta?.agregarTransaccion(
        .gasto(
            cantidad: 90,
            descripcion: "Linea telefonica",
            categoria: .celular,
            fecha: Date(anio: 2020, mes: 01, dia: 07)
        )
    )
} catch {
    print("Linea telefonica", error)
}

do {
    try persona.cuenta?.agregarTransaccion(
        .gasto(
            cantidad: 30,
            descripcion: "Pasaje mensual",
            categoria: .transporte,
            fecha: Date(anio: 2020, mes: 01, dia: 07)
        )
    )
} catch {
    print("Pasaje mensual", error)
}

do {
    try persona.cuenta?.agregarTransaccion(
        .gasto(
            cantidad: 100,
            descripcion: "Curso Platzi",
            categoria: .estudio,
            fecha: Date(anio: 2020, mes: 01, dia: 07)
        )
    )
} catch {
    print("Curso Platzi", error)
}

do {
    try persona.cuenta?.agregarTransaccion(
        .gasto(
            cantidad: 300,
            descripcion: "Ahorro",
            categoria: .ahorro,
            fecha: Date(anio: 2020, mes: 01, dia: 07)
        )
    )
} catch {
    print("Ahorro", error)
}

do {
    try persona.cuenta?.agregarTransaccion(
        .gasto(
            cantidad: 50,
            descripcion: "Presupuesto Extra",
            categoria: .extra,
            fecha: Date(anio: 2020, mes: 01, dia: 07)
        )
    )
} catch {
    print("Presupuesto Extra", error)
}

// Gastos semanales
do {
    try persona.cuenta?.agregarTransaccion(
        .gasto(
            cantidad: (35*4),
            descripcion: "Comida semanal para Snow",
            categoria: .alimentoSnow,
            fecha: Date(anio: 2020, mes: 01, dia: 07)
        )
    )
} catch {
    print("Comida semanal para Snow", error)
}

do {
    try persona.cuenta?.agregarTransaccion(
        .gasto(
            cantidad: (70*4),
            descripcion: "Comida semanal",
            categoria: .alimento,
            fecha: Date(anio: 2020, mes: 01, dia: 07)
        )
    )
} catch {
    print("Comida semanal", error)
}

print("Gasto total: \(persona.cuenta?.obtenerGastoTotal() ?? 0) ")
print("Dinero habil para gastar: \(persona.cuenta?.cuenta ?? 0)")
