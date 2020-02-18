import Foundation

public enum CuentaException: Error {
    case transaccionInvalida
    case cantidadExcedida
    case presupuestoExcedido
}

public enum CategoriaGasto: Int {
    case salud
    case alimento, renta, transporte, alimentoSnow
    case entretenimiento
}

public enum TipoTransaccion {
    case gasto(cantidad: Float, descripcion: String, categoria: CategoriaGasto, fecha: Date)
    case ingreso(cantidad: Float, descripcion: String, fecha: Date)
}
