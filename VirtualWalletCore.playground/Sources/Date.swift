import Foundation

public extension Date {
    init(anio: Int, mes: Int, dia: Int) {
        var dateComponents = DateComponents()
        dateComponents.year = anio
        dateComponents.month = mes
        dateComponents.day = dia
        dateComponents.timeZone = TimeZone(abbreviation: "PET")
        let calendario = Calendar.current
        self = calendario.date(from: dateComponents) ?? Date()
    }
}
