import Foundation

public extension Date {
    init(anio: Int, mes: Int, dia: Int) {
        let calendario = Calendar(identifier: .gregorian)
        var dateComponents = DateComponents()
        dateComponents.year = anio
        dateComponents.month = mes
        dateComponents.day = dia
        self = calendario.date(from: dateComponents) ?? Date()
    }
}
