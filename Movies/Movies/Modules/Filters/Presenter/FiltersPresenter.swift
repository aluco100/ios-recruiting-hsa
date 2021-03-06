//
//  FiltersPresenter.swift
//  Movies
//
//  Created by Alfredo Luco on 07-02-21.
//

import Foundation

class FiltersPresenter: ViewToPresenterFiltersProtocol {
    //MARK: - Memory debug
    
    deinit {
        print("filters presenter dealloc")
    }
    
    //MARK: - Variables
    
    weak var view: PresenterToViewFiltersProtocol?
    var interactor: PresenterToInteractorFiltersProtocol?
    var router: PresenterToRouterFiltersProtocol?
    
    
    //MARK: - Fetch Filters
    
    func fetchFilters() {
        interactor?.fetchFilters()
    }
}

//MARK: - Presentation Logic

extension FiltersPresenter: InteractorToPresenterFiltersProtocol {
    func fetchFiltersSuccessfull(_ filters: [Filter<String>]) {
        view?.fetchFiltersSuccessfull(filters)
    }
    
    func failure(_ error: Error) {
        view?.failure(error)
    }
}
