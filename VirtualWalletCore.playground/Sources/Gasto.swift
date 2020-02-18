import Foundation

public protocol TransaccionGasto: Transaccion {
    var categoria: CategoriaGasto { get }
}

public class Gasto: TransaccionGasto {
    public var categoria: CategoriaGasto
    public var cantidad: Float
    public var descripcion: String
    public var esValido: Bool = true
    public var delegate: TransaccionInvalida?
    public var fecha: Date
    public var handler: TransaccionHandler?
    public var completado: Bool = false
    public var confirmacion: Date?
    
    public init(cantidad: Float, descripcion: String, categoria: CategoriaGasto, fecha: Date) {
        self.cantidad = cantidad
        self.descripcion = descripcion
        self.categoria = categoria
        self.fecha = fecha
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.handler?(true, Date())
            print("\(descripcion): Gasto confirmado.", Date())
        }
    }
}
