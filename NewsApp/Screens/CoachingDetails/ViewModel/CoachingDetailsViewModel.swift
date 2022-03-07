//
//  ArticleDetailsViewModel.swift
//  NewsApp
//
//  Created by Mohannad on 2/6/22.
//
import RxSwift

class CoachingDetailsViewModel: CoachingDetailsViewModelProtocol , CoachingDetailsViewModelEvents {
    
    var inputs : CoachingDetailsViewModelInput {self}
    
    var outputs : CoachingDetailsViewModelOutput {self}
    
    var tabs: BehaviorSubject<[TabViewData]>
    
    var sections : BehaviorSubject<[SectionViewData]>
    
    let disposeBag = DisposeBag()
    
    init() {
        tabs = BehaviorSubject(value: [])
        sections = BehaviorSubject(value: [])
        buildTabsModels()
        buildSectionsUI()
    }
    
    func buildTabsModels(){
        let titles = ["Overview" , "Classes" , "Community"]
        let tabs =  titles.map{return TabViewData(name: $0 )}
        tabs.first?.isActive = true
        self.tabs.onNext(tabs)
    }
    
    func buildSectionsUI(){
        let classes : [SectionItem] = [.Classes , .Classes , .Classes]
        let sectionsData =  [
             SectionViewData(original: .OverViewSec(items: [.OverView]), items: []),
             SectionViewData(original: .InstructorSec(items: [.Instructor]), items: []) ,
             SectionViewData(original: .StatisticsSec(items: [.Statistics]), items: []),
             SectionViewData(original: .ClassesSec(items: classes), items: [])]
        self.sections.onNext(sectionsData)
    }
    
}

