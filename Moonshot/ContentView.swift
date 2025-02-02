//
//  ContentView.swift
//  Moonshot
//
//  Created by Paul Hudson on 29/10/2023.
//  Modified by Leandro Vansan on 2024

import SwiftUI

struct ContentView: View {
	let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
	
    @Environment(\.colorScheme) private var colorScheme
	
    let columns = [
		GridItem(.adaptive(minimum: 150))
	]

	var body: some View {
		NavigationStack {
			ScrollView {
				LazyVGrid(columns: columns) {
					ForEach(missions) { mission in
						NavigationLink {
							MissionView(mission: mission, astronauts: astronauts)
						} label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                    //.foregroundStyle(.white.opacity(0.8))
                                        .foregroundStyle(colorScheme == .light ? .darkPrimary : .lightPrimary)
                                    
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(colorScheme == .light ? .darkSecondary : .lightSecondary)
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(colorScheme == .light ? .darkBackground : .lightBackground)
                            }
							.clipShape(.rect(cornerRadius: 10))
							.overlay(
								RoundedRectangle(cornerRadius: 10)
                                    .stroke(colorScheme == .light ? .darkBackground : .lightBackground)
                                
							)
						}
					}
				}
				.padding([.horizontal, .bottom])
			}
			.navigationTitle("Moonshot")
            .background(colorScheme == .dark ? .darkBackground : .lightBackground)
			//.preferredColorScheme(.dark) // sempre deixar a barra de títulos na cor preferida
		}
	}
}

#Preview {
	ContentView()
}
