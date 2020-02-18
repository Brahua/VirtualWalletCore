import Foundation

public class Cuenta {
    public var cuenta: Float = 0 {
        willSet {
            print("Vamos a cambiar el valor", cuenta, newValue)
        }
        didSet {
            print("Tenemos nuevo valor", cuenta)
        }
    }
    public var descripcion: String = ""
    public var transacciones: [Transaccion] = []
    public var gastos: [Gasto] = []
    public var ingresos: [Ingreso] = []
    public var presupuestos = [CategoriaGasto: Presupuesto]()
    
    public init(cuenta: Float, descripcion: String){
        self.cuenta = cuenta
        self.descripcion = descripcion
    }
    
    @discardableResult
    public func agregarTransaccion(transaccion: TipoTransaccion) throws -> Transaccion? {
        switch transaccion {
            case .gasto(let cantidad, let descripcion, let categoria, let fecha):
                if cuenta < cantidad {
                    throw CuentaException.cantidadExcedida
                }
                
                let total = transaccionesDe(categoria: categoria).reduce(0.0, {
                    $0 + $1.cantidad
                })
                
                if(total+cantidad) > presupuestos[categoria]?.cantidad ?? 0{
                    throw CuentaException.presupuestoExcedido
                }
                
                let gasto = Gasto(cantidad: cantidad, descripcion: descripcion, categoria: categoria, fecha: fecha)
                gasto.delegate = self
                
                gasto.handler = { (completado, confirmacion) in
                    gasto.confirmacion = confirmacion
                    self.cuenta -= gasto.cantidad
                    self.transacciones.append(gasto)
                    self.gastos.append(gasto)
                }
                
                return gasto
            case .ingreso(let cantidad, let descripcion, let fecha):
                let ingreso = Ingreso(cantidad: cantidad, descripcion: descripcion, fecha: fecha)
                ingreso.delegate = self
                ingreso.handler = { (completado, confirmacion) in
                    ingreso.confirmacion = confirmacion
                    self.cuenta += ingreso.cantidad
                    self.transacciones.append(ingreso)
                    self.ingresos.append(ingreso)
                }
                return ingreso
        }
    }
    
    public func transaccionesDe(categoria: CategoriaGasto) -> [Transaccion]{
        return transacciones.filter({ (transaccion) -> Bool in
            guard let transaccion = transaccion as? Gasto else {
                return false
            }
            
            return transaccion.esValido && transaccion.categoria == categoria
        })
    }
    
    public func agregar(presupuesto: Presupuesto){
        self.presupuestos[presupuesto.categoria] = presupuesto
    }
    
    public func presupuestoDe(categoria: CategoriaGasto) -> Float {
        return self.presupuestos[categoria]?.cantidad ?? 0;
    }
    
    public func tiempoDeVida() -> Int{
        var total: Float = 0
        
        for key in presupuestos.keys {
            total += presupuestos[key]!.cantidad
        }
        
        let meses = Int(cuenta/total)
        print("Tenemos \(meses) meses de vida")
        return meses
    }
}

extension Cuenta: TransaccionInvalida {
    public func transaccionInvalidada(transaccion: Transaccion) {
        if transaccion is Gasto {
            cuenta += transaccion.cantidad
        }
        if transaccion is Ingreso {
            cuenta -= transaccion.cantidad
        }
    }
}
