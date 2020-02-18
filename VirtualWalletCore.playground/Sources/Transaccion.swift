import Foundation


public protocol TransaccionInvalida {
    func transaccionInvalidada(transaccion: Transaccion)
}

public typealias TransaccionHandler = ((_ completado: Bool, _ confirmacion: Date) -> Void)

public protocol Transaccion {
    var cantidad: Float { get }
    var descripcion: String { get }
    var esValido: Bool { get set }
    var delegate: TransaccionInvalida? { get set } //delegate
    var fecha: Date { get }
    var handler: TransaccionHandler? { get set } //clousure
    var completado: Bool { get }
    var confirmacion: Date? { get set }
}

extension Transaccion {
    mutating public func transaccionInvalidada(transaccion: Transaccion){
        if completado {
            esValido = false
            delegate?.transaccionInvalidada(transaccion: self)
        }
    }
}
