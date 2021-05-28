//
//  MockPersonDetailWorker.swift
//  MoviesXTests
//
//  Created by Wilmer Mendoza on 28/5/21.
//

@testable import MoviesX

class MockPersonDetailWorker: BaseWorker, FetchPersonDetailProtocol {
    
    var successFetch: Bool = true

    func getPersonDetail(personId: Int, completion: @escaping (Bool, PersonDetail?) -> Void) {
       
        if successFetch {
            completion(true, mockPersonDetail)
        } else {
            completion(false, nil)
        }
    }
}

let mockPersonDetail = PersonDetail(birthday: "1969-08-18",
                                    knownForDepartment: "Acting",
                                    deathday: nil,
                                    id: 819,
                                    name: "Edward Norton",
                                    alsoKnownAs: nil,
                                    gender: 2,
                                    biography: "Edward Harrison Norton (born August 18, 1969) is an American actor, screenwriter, film director and producer. In 1996, his supporting role in the courtroom drama Primal Fear garnered him a nomination for the Academy Award for Best Supporting Actor. Two years later, his lead role as a reformed white power skinhead in American History X earned a nomination for Academy Award for Best Actor. His other films include period dramas such as Kingdom of Heaven (2005), The Illusionist (2006), and The Painted Veil (2006); and other notable films such as Rounders (1998), Fight Club (1999), 25th Hour (2002), Red Dragon (2002), and The Incredible Hulk (2008).\n\nIn addition to acting, Norton is also a writer and director. He made his directorial debut with the film Keeping the Faith (2000) and is slated to direct the film adaptation of the novel Motherless Brooklyn. Norton did uncredited work on the scripts for The Score, Frida, and The Incredible Hulk.\n\nIn his private life, Norton is an environmental and social activist. He is a member of the board of trustees of Enterprise Community Partners, a non-profit organization for developing affordable housing, founded by his grandfather, James Rouse. Norton is president of the American branch of the Maasai Wilderness Conservation Trust. He ran in the 2009 New York City Marathon to raise money for the Trust. He also raises money for charity through Crowdrise, a social networking community for volunteers and a micro-donations fundraising platform. In July 2010, Norton was designated as the United Nations Goodwill Ambassador for Biodiversityby UN Secretary-General Ban Ki-moon.",
                                    popularity: 4.5,
                                    placeOfBirth: "Boston, Massachusetts, USA",
                                    adult: false,
                                    imdbId: "nm0001570",
                                    homepage: nil,
                                    profilePath: "/5XBzD5WuTyVQZeS4VI25z2moMeY.jpg")
