//
//  Color-Theme.swift
//  Moonshot
//
//  Created by Paul Hudson on 30/10/2023.
//  Modified by Leandro Vansan on 2024

// import SwiftUI
//
//extension ShapeStyle where Self == Color {
//    
//	static var darkBackground: Color {
//		Color(red: 0.007843137254901961, green: 0.06274509803921569, blue: 0.1411764705882353) // dark blue
//    }
//
//    static var lightBackground: Color {
//		Color(red: 0.49019607843137255, green: 0.6274509803921569, blue: 0.792156862745098) // light blue (apple blue sierra lol)
//    }
//}

import SwiftUI

extension ShapeStyle where Self == Color {
    
//MARK: -- BACKGROUND
	static var darkBackground: Color {
		Color(red: 0.086, green: 0.086, blue: 0.086) // Dark Gray (HEX: #171717)
	}
	static var lightBackground: Color {
		Color(red: 0.869, green: 0.869, blue: 0.869) // Silver (HEX: #D7D7DE)
	}
//MARK: -- PRIMARY
	static var darkPrimary: Color {
		Color(red: 0.235, green: 0.702, blue: 0.878) // Azul celeste
	}
	static var lightPrimary: Color {
		Color(red: 0.294, green: 0.569, blue: 0.843) // Azul NASA
	}
//MARK: -- SECUNDARY
	static var darkSecondary: Color {
		Color(red: 0.157, green: 0.431, blue: 0.627) // Azul escuro
	}
	static var lightSecondary: Color {
		Color(red: 0.471, green: 0.612, blue: 0.741) // Cinza claro
	}
//MARK: -- TEXT
	static var darkText: Color {
		Color(red: 0.949, green: 0.949, blue: 0.969) // Branco lunar
	}
	static var lightText: Color {
		Color(red: 0.086, green: 0.086, blue: 0.086) // Preto espacial
	}
}
