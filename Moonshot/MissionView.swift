//
//  MissionView.swift
//  Moonshot
//
//  Created by Paul Hudson on 31/10/2023.
//  Modified by Leandro Vansan on 2024

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }

    let mission: Mission
    let crew: [CrewMember]
    
	@Environment(\.colorScheme) private var colorScheme

    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    
                VStack(alignment: .leading) {
                    //lineDivider
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(colorScheme == .light ? .darkBackground.opacity(0.1) : .lightBackground.opacity(0.1))
                        .padding(.vertical)

                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)

                    Text(mission.description)
                        .font(.callout)
                        .bold()
						.foregroundStyle(colorScheme == .dark ? .darkSecondary : .lightSecondary)
                    //lineDivider
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(colorScheme == .light ? .darkBackground.opacity(0.1) : .lightBackground.opacity(0.1))
                        .padding(.vertical)

                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(crew, id: \.role) { crewMember in
                            NavigationLink {
                                AstronautView(astronaut: crewMember.astronaut)
                            } label: {
                                HStack {
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .frame(width: 104, height: 72)
                                        .clipShape(.capsule)
                                        .overlay(
                                            Capsule()
                                                .strokeBorder(.white, lineWidth: 1)
                                        )

                                    VStack(alignment: .leading) {
                                        Text(crewMember.astronaut.name)
											.foregroundStyle(colorScheme == .dark ? .darkPrimary : .lightPrimary)
                                            .font(.title3.bold())

                                        Text(crewMember.role)
											.foregroundStyle(colorScheme == .dark ? .darkSecondary : .lightSecondary)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(colorScheme == .dark ? .darkBackground : .lightBackground)
    }

    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission

        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
