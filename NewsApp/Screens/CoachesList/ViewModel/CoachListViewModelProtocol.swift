//
//  CoachListViewModelProtocol.swift
//  NewsApp
//
//  Created by Mohannad on 2/5/22.
//
import RxSwift

typealias  CoachListViewModelEvents = CoachListViewModelInput & CoachListViewModelOutput & CoachListViewModelInternal

protocol CoachListViewModelOutput  {
    
    var coaches : BehaviorSubject<[CoacheViewData]> {get}
    
    var isLoading : BehaviorSubject<Bool> {get}
    
    var isLoadingMore : BehaviorSubject<Bool> {get}

    var onError : PublishSubject<String> {get}
    
    var onMaximumResultsReachedError :  PublishSubject<String> {get}
}

protocol CoachListViewModelInput {
 
    var reachedBottomTrigger : PublishSubject<Void>{get}
}

protocol CoachListViewModelInternal{
    
    var writeToLocalDbTrigger : PublishSubject<[Coach]> {get}
    
    var loadFromLocalDbTriggerWith : PublishSubject<ApiError>{get}
    
    var rawCoachs : PublishSubject<SearchCoachingResponse> {get}
}


protocol CoachListViewModelProtocol {
    
    var inputs : CoachListViewModelInput {get}
    
    var outputs : CoachListViewModelOutput {get}
    
    var internals : CoachListViewModelInternal {get}
    
    func loadCoachs()
    
    func configureReachedBottomTrigger()
}
