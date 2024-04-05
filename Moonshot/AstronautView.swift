//
//  AstronautView.swift
//  Moonshot
//
//  Created by Paul Hudson on 31/10/2023.
//  Modified by Leandro Vansan on 2024

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut

	@Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()

                Text(astronaut.description)
                    .padding()
					.foregroundStyle(colorScheme == .dark ? .darkSecondary : .lightPrimary)
            }
        }
        .background(colorScheme == .dark ? .darkBackground : .lightBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    return AstronautView(astronaut: astronauts["aldrin"]!)
        .preferredColorScheme(.dark)
}
