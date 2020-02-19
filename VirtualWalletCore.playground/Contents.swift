import UIKit

var persona = Persona(nombre: "Josue", apellido: "Bravo")
persona.cuenta = Cuenta(cuenta: 0, descripcion: "Cuenta Personal")

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


func agregarIngreso(cantidad: Float, descripcion: String, fecha: Date){
    do {
        try persona.cuenta?.agregarTransaccion(
            .ingreso(cantidad: cantidad, descripcion: descripcion, fecha: fecha)
        )
    } catch {
        print("No se puedo generar la transacción: \(descripcion):S/.\(cantidad)")
    }
}

func agregarGasto(cantidad: Float, descripcion: String, categoria: CategoriaGasto, fecha: Date){
    do {
        try persona.cuenta?.agregarTransaccion(
            .gasto(cantidad: cantidad, descripcion: descripcion, categoria: categoria, fecha: fecha)
        )
    } catch CuentaException.presupuestoExcedido {
        print("\(descripcion): El gasto S/.\(cantidad) excede del presupuesto establecido.")
    } catch CuentaException.cantidadExcedida {
        print("\(descripcion): El gasto S/.\(cantidad) excede su cuenta personal.")
    } catch {
        print("No se puedo generar la transacción: \(descripcion):S/.\(cantidad)")
    }
}

agregarIngreso(
    cantidad: 1500,
    descripcion: "Sueldo Mensual",
    fecha: Date(anio: 2020, mes: 1, dia: 7)
)

agregarGasto(
    cantidad: 80,
    descripcion: "Casa",
    categoria: .renta,
    fecha: Date()
)
agregarGasto(
    cantidad: 44.90,
    descripcion: "Netflix",
    categoria: .entretenimiento,
    fecha: Date(anio: 2020, mes: 01, dia: 07)
)
agregarGasto(
    cantidad: 18.90,
    descripcion: "Spotify",
    categoria: .entretenimiento,
    fecha: Date(anio: 2020, mes: 01, dia: 07)
)
agregarGasto(
    cantidad: 90,
    descripcion: "Linea telefonica",
    categoria: .celular,
    fecha: Date(anio: 2020, mes: 01, dia: 07)
)
agregarGasto(
    cantidad: 30,
    descripcion: "Pasaje mensual",
    categoria: .transporte,
    fecha: Date(anio: 2020, mes: 01, dia: 07)
)
agregarGasto(
    cantidad: 100,
    descripcion: "Curso Platzi",
    categoria: .estudio,
    fecha: Date(anio: 2020, mes: 01, dia: 07)
)
agregarGasto(
    cantidad: (35*4),
    descripcion: "Comida semanal para Snow",
    categoria: .alimentoSnow,
    fecha: Date(anio: 2020, mes: 01, dia: 07)
)
agregarGasto(
    cantidad: (70*4),
    descripcion: "Comida semanal",
    categoria: .alimento,
    fecha: Date(anio: 2020, mes: 01, dia: 07)
)


print("Gasto total: \(persona.cuenta?.obtenerGastoTotal() ?? 0) ")
print("Dinero habil para gastar: \(persona.cuenta?.cuenta ?? 0)")
