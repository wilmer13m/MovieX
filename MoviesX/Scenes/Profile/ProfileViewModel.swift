//
//  ProfileViewModel.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 27/5/21.
//

import Combine

class ProfileViewModel: ObservableObject {
    
    private let personDetailWorker: FetchPersonDetailProtocol
    
    let titleAlert = "moviex_error".localized()
    let messageAlert = "movie_failed_connection".localized()
    
    @Published var personDetail: PersonDetail?
    @Published var showAlert = false
    @Published var showLoader = true

    init(personDetailWorker: FetchPersonDetailProtocol = PersonDetailWorker()) {
        self.personDetailWorker = personDetailWorker
    }
    
    /// This function fetch a person detail for a given `personId`.
 
    /// - Parameter personId: the id of the person that you want to looking for
    func getProfileDetail(personId: Int) {
        
        showLoader = true
        
        personDetailWorker.getPersonDetail(personId: personId) { [weak self] (success, response) in
           
            guard let self = self else {return}
            
            self.showLoader = false

            if success {
                self.personDetail = response
                
            } else {
                self.showAlert = true
            }
        }
    }
}
