import Foundation

public enum CuentaException: Error {
    case transaccionInvalida
    case cantidadExcedida
    case presupuestoExcedido
}

public enum CategoriaGasto: Int {
    case estudio, ahorro, extra
    case alimento, renta, transporte, alimentoSnow
    case entretenimiento, serviciosBasicos, celular
}

public enum TipoTransaccion {
    case gasto(cantidad: Float, descripcion: String, categoria: CategoriaGasto, fecha: Date)
    case ingreso(cantidad: Float, descripcion: String, fecha: Date)
}
