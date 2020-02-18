import Foundation

public class Presupuesto {
    public var categoria: CategoriaGasto
    public var cantidad: Float
    public var descripcion: String
    
    public init(categoria: CategoriaGasto, cantidad: Float, descripcion: String){
        self.categoria = categoria
        self.cantidad = cantidad
        self.descripcion = descripcion
    }
}
