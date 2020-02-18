import Foundation

public class Ingreso: Transaccion {
    public var cantidad: Float
    public var descripcion: String
    public var esValido: Bool = true
    public var delegate: TransaccionInvalida?
    public var fecha: Date
    public var handler: TransaccionHandler?
    public var completado: Bool = false
    public var confirmacion: Date?
    
    public init(cantidad: Float, descripcion: String, fecha: Date){
        self.cantidad = cantidad
        self.descripcion = descripcion
        self.fecha = fecha
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.handler?(true, Date())
            print("\(descripcion): Ingreso confirmado.", Date())
        }
    }
}
