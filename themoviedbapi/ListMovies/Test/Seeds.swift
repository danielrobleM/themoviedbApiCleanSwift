//
//  Seeds.swift
//  themoviedbapi
//
//  Created by Daniel on 02-06-20.
//  Copyright © 2020 idorm. All rights reserved.
//

@testable import themoviedbapi
import XCTest

struct Seeds {
  struct Movies {
    static let BadBoysforLife = MovieModel(id: 38700, title: "Bad Boys for Life", releaseDate: "2020-01-15", overview: "Marcus and Mike are forced to confront new threats, career changes, and midlife crises as they join the newly created elite team AMMO of the Miami police department to take down the ruthless Armando Armas, the vicious leader of a Miami drug cartel.", posterPath: "/y95lQLnuNKdPAzw9F9Ab8kJ80c3.jpg")
    static let SonictheHedgehog = MovieModel(id: 454626, title: "Sonic the Hedgehog", releaseDate: "2020-02-12", overview: "Based on the global blockbuster videogame franchise from Sega, Sonic the Hedgehog tells the story of the world’s speediest hedgehog as he embraces his new home on Earth. In this live-action adventure comedy, Sonic and his new best friend team up to defend the planet from the evil genius Dr. Robotnik and his plans for world domination.", posterPath: "/aQvJ5WPzZgYVDrxLX4R6cLJCEaQ.jpg")
  }
}
