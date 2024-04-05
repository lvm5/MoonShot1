//
//  Mission.swift
//  Moonshot
//
//  Created by Paul Hudson on 30/10/2023.
//  Modified by Leandro Vansan on 2024

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String

    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }

    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}

// MARK: -- DATE BRAZIL
//struct Mission: Codable, Identifiable {
//  struct CrewRole: Codable {
//    let name: String
//    let role: String
//  }
//
//  let id: Int
//  let launchDate: Date?
//  let crew: [CrewRole]
//  let description: String
//
//  var displayName: String {
//    "Apollo \(id)"
//  }
//
//  var image: String {
//    "apollo\(id)"
//  }
//
//  var formattedLaunchDate: String {
//    let formatter = DateFormatter()
//    formatter.locale = Locale(identifier: "pt-BR") // Define o locale para o Brasil
//    formatter.dateFormat = "dd-MMMM-yyyy" // Formato de data dia-mês-ano
//
//    guard let launchDate = launchDate else {
//      return "N/A"
//    }
//    
//    return formatter.string(from: launchDate)
//  }
//}
//
