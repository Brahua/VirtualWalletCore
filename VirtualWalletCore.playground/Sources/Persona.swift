import Foundation

public class Persona {
    public var nombre: String = ""
    public var apellido: String = ""
    public var cuenta: Cuenta?
    public var nombreCompleto: String {
        return "\(nombre) \(apellido)"
    }
    
    public init(nombre: String, apellido: String){
        self.nombre = nombre
        self.apellido = apellido
    }
}
