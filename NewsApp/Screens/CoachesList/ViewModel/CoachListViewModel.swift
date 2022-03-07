//
//  CoachListViewModel.swift
//  NewsApp
//
//  Created by Mohannad on 2/5/22.
//

import RxSwift
import RealmSwift

class CoachListViewModel: CoachListViewModelProtocol &  CoachListViewModelEvents {
    var coaches: BehaviorSubject<[CoacheViewData]>
    
    var inputs : CoachListViewModelInput {return self}
    
    var outputs : CoachListViewModelOutput {return self}
    
    var internals: CoachListViewModelInternal {return self}
    
    
    var rawCoachs : PublishSubject<SearchCoachingResponse>
    
    var onError: PublishSubject<String>
    
    var isLoading: BehaviorSubject<Bool>
    
    var isLoadingMore : BehaviorSubject<Bool>
    
    var reachedBottomTrigger : PublishSubject<Void>
    
    var writeToLocalDbTrigger: PublishSubject<[Coach]>
    
    var loadFromLocalDbTriggerWith : PublishSubject<ApiError>
    
    var onMaximumResultsReachedError : PublishSubject<String>
    
    let disposeBag = DisposeBag()
    
    var apiService : CoachingServiceProtocol
    
    var localStorage : LocalStorageProtocol
    
    var currentPage : Int
    
    var pageCount : Int
    
    var pageSize : Int
    
    var query : String
    
    init(api : CoachingServiceProtocol = CoachingService() , localDb : LocalStorageProtocol = LocalStorage() ) {
        isLoading = BehaviorSubject(value: false)
        isLoadingMore = BehaviorSubject(value: false)
        coaches = BehaviorSubject(value: [])
        rawCoachs = PublishSubject<SearchCoachingResponse>()
        onError = PublishSubject()
        reachedBottomTrigger = PublishSubject()
        writeToLocalDbTrigger = PublishSubject()
        loadFromLocalDbTriggerWith = PublishSubject()
        onMaximumResultsReachedError = PublishSubject()
        apiService = api
        localStorage = localDb
        currentPage = 1
        pageCount = -1
        pageSize = 25
        query = "bitcoin"
        configureReachedBottomTrigger()
        subscribingToWriteToLocalDB()
        subscribingToLoadFromLocalDB()
        subcribingToRawCoachs()
    }
    
    func loadCoachs()  {
         isLoading.onNext(currentPage == 1)
         apiService.searchCoaches(query: query, page: currentPage, pageSize: 25)
        .bind(to: rawCoachs).disposed(by: disposeBag)
    }
    
    func subcribingToRawCoachs(){
        internals.rawCoachs.subscribe{[weak self] event in
            guard let self = self else { return }
            if let info = event.element , var items = try? self.coaches.value()  {
                let newBatch = info.coaches.map{CoacheViewData(data: $0)}
                items.append(contentsOf: newBatch)
                self.coaches.onNext(items)
                self.isLoadingMore.onNext(false)
                self.isLoading.onNext(false)
                self.pageCount = Int(info.totalResults / self.pageSize)
                let Coachs = newBatch.map{Coach(data: $0)}
                self.internals.writeToLocalDbTrigger.onNext(Coachs)
            }
            else if let error = event.error  as? ApiError{
                if error != .maximumResultsReached { // that means it fails to load content
                  self.internals.loadFromLocalDbTriggerWith.onNext(error)
                }
                else {
                  self.onMaximumResultsReachedError.onNext(error.message)
                }
            }
        }.disposed(by: disposeBag)
    }
    
    func configureReachedBottomTrigger(){
        reachedBottomTrigger.filter{ [weak self] in
            guard let self = self else { return false}
            return self.currentPage < self.pageCount
        }
        .withLatestFrom(isLoadingMore)
        .filter{$0 == false}
        .subscribe(onNext :{ [weak self] event in
            guard let self = self else { return }
            self.currentPage += 1
            self.isLoadingMore.onNext(true)
            self.loadCoachs()
        }).disposed(by: disposeBag)
    }
    
    func subscribingToWriteToLocalDB(){
        internals.writeToLocalDbTrigger.subscribe(onNext :{[weak self] Coachs in
            guard let self = self else { return }
            print(NSHomeDirectory())
            if self.currentPage == 1 {
                self.localStorage.deleteAll(Coach.self)
            }
           self.localStorage.write(Coachs)
        }).disposed(by: disposeBag)
    }
    
    func subscribingToLoadFromLocalDB(){
        internals.loadFromLocalDbTriggerWith.subscribe(onNext :{[weak self] error in
            guard let self = self else { return }
            print(NSHomeDirectory())
            let Coachs : [Coach] =  self.localStorage.objects()
            if Coachs.count > 0 {
                let items = Coachs.map{CoacheViewData(stored: $0)}
                self.coaches.onNext(items)
                self.isLoadingMore.onNext(false)
                self.isLoading.onNext(false)
            }
            else {
                self.onError.onNext(error.message)
            }
         
        }).disposed(by: disposeBag)
    }
    
    
    
}
