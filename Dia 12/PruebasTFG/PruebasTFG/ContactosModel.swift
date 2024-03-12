// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let contactosModel = try? JSONDecoder().decode(ContactosModel.self, from: jsonData)

import Foundation

// MARK: - ContactosModelElement
struct ContactosModel: Codable, Identifiable {
    let id: Int?
    let nombre: String?
    let edad: Int?
    let imagen: String?
    let telefono: String?
}

