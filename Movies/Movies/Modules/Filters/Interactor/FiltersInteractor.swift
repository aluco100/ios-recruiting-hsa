//
//  FiltersInteractor.swift
//  Movies
//
//  Created by Alfredo Luco on 07-02-21.
//

import Foundation

class FiltersInteractor: PresenterToInteractorFiltersProtocol {
    //MARK: - Memory debug
    
    deinit {
        print("filters interactor dealloc")
    }
    
    //MARK: - Variables
    
    weak var presenter: InteractorToPresenterFiltersProtocol?
    fileprivate var worker: FiltersWorker = FiltersWorker()
    
    //MARK: - Fetch Filters
    
    func fetchFilters() {
        let filters = worker.retrieveFilters()
        self.presenter?.fetchFiltersSuccessfull(filters)
    }
}
